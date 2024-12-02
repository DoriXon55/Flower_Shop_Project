from django.contrib.auth.models import User
from django.shortcuts import render, get_object_or_404, redirect
from .models import Flower, Individual, Firm, Customer, OrderFlower, Order, PaymentType, DeliveryName, Status, Delivery, \
    Employee
from datetime import timedelta, datetime
from django.contrib import messages


def home(request):
    flowers = Flower.objects.all()
    view_type = request.GET.get('view', 'grid')  # Domyślnie widok siatki
    return render(request, 'shop_app/home.html', {
        'flowers': flowers,
        'view_type': view_type
    })

def flower_detail(request, flower_id):
    flower = get_object_or_404(Flower, flower_id=flower_id)
    if request.method == 'POST':  # Dodanie do koszyka
        cart = request.session.get('cart', {})
        cart[str(flower_id)] = cart.get(str(flower_id), 0) + int(request.POST.get('quantity', 1))
        request.session['cart'] = cart
        return redirect('cart')
    return render(request, 'shop_app/flower_detail.html', {'flower': flower})
def cart_view(request):
    cart = request.session.get('cart', {})
    flowers = Flower.objects.filter(flower_id__in=cart.keys())
    cart_items = [{'flower': flower, 'quantity': cart[str(flower.flower_id)]} for flower in flowers]
    total_price = sum(item['flower'].price * item['quantity'] for item in cart_items)

    return render(request, 'shop_app/cart.html', {
        'cart_items': cart_items,
        'total_price': total_price
    })


def add_to_cart(request, flower_id):
    # Pobierz dane o kwiatku z bazy danych
    flower = Flower.objects.get(id=flower_id)

    # Inicjalizowanie koszyka w sesji, jeśli jeszcze nie istnieje
    if 'cart' not in request.session:
        request.session['cart'] = {}

    cart = request.session['cart']

    # Dodanie lub aktualizacja kwiatu w koszyku
    cart[str(flower.id)] = {
        'name': flower.flower_name,
        'price': flower.price,
        'quantity': cart.get(str(flower.id), {}).get('quantity', 0) + 1
    }

    # Zaktualizowanie sesji
    request.session['cart'] = cart

    return redirect('cart')  # Przekierowanie do strony z koszykiem

def remove_from_cart(request, flower_id):
    cart = request.session.get('cart', {})
    if str(flower_id) in cart:
        del cart[str(flower_id)]
        request.session['cart'] = cart
    return redirect('cart')
def register(request):
    if request.method == 'POST':
        user_type = request.POST.get('user_type', 'individual')
        contact = request.POST.get('contact')
        address = request.POST.get('address')

        # Dodawanie klienta do bazy
        customer = Customer.objects.create(
            customer_contact=contact,
            address=address
        )

        # Dostosowanie danych w zależności od typu użytkownika
        if user_type == 'individual':
            Individual.objects.create(
                customer=customer,
                individual_name=request.POST.get('first_name'),
                surname=request.POST.get('last_name')
            )
        elif user_type == 'firm':
            Firm.objects.create(
                customer=customer,
                name=request.POST.get('firm_name'),
                NIP=request.POST.get('NIP')
            )

        messages.success(request, "Rejestracja zakończona sukcesem!")
        return redirect('home')

    return render(request, 'shop_app/register.html')

from random import choice

def checkout(request):
    cart = request.session.get('cart', {})
    flowers = Flower.objects.filter(flower_id__in=cart.keys())
    cart_items = [{'flower': flower, 'quantity': cart[str(flower.flower_id)]} for flower in flowers]
    total_price = sum(item['flower'].price * item['quantity'] for item in cart_items)

    if request.method == 'POST':
        # Dodawanie zamówienia
        customer = Customer.objects.first()  # Przykład: pobierz zalogowanego klienta
        employee = choice(Employee.objects.all())  # Losowy pracownik
        delivery = Delivery.objects.create(
            delivery_data=datetime.now() + timedelta(days=3),
            delivery_name=DeliveryName.objects.first(),
            status=Status.objects.first()
        )
        order = Order.objects.create(
            total_amount=total_price,
            customer=customer,
            employee=employee,
            delivery=delivery,
            payment_type=PaymentType.objects.first()
        )

        # Dodanie kwiatów do zamówienia
        for item in cart_items:
            OrderFlower.objects.create(
                order=order,
                flower=item['flower'],
                quantity=item['quantity']
            )

        request.session['cart'] = {}  # Opróżnij koszyk
        messages.success(request, "Zamówienie zostało złożone!")
        return redirect('home')

    return render(request, 'shop_app/checkout.html', {
        'cart_items': cart_items,
        'total_price': total_price
    })
