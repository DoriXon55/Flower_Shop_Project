from random import random

from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import HttpResponse
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
    cart_items = []

    # Tworzenie listy pozycji w koszyku
    for flower in flowers:
        flower_id = str(flower.flower_id)
        if flower_id in cart:
            cart_items.append({
                'flower': flower,
                'quantity': cart[flower_id]['quantity']
            })

    # Obliczanie całkowitej ceny
    total_price = sum(item['flower'].price * item['quantity'] for item in cart_items)

    return render(request, 'shop_app/cart.html', {
        'cart_items': cart_items,
        'total_price': total_price
    })



def add_to_cart(request, flower_id):
    # Pobierz dane o kwiatku z bazy danych
    flower = Flower.objects.get(flower_id=flower_id)  # Zmiana z id na flower_id

    # Inicjalizowanie koszyka w sesji, jeśli jeszcze nie istnieje
    if 'cart' not in request.session:
        request.session['cart'] = {}

    cart = request.session['cart']

    # Pobierz ilość z formularza, domyślnie 1
    quantity = int(request.POST.get('quantity', 1))

    # Dodanie lub aktualizacja kwiatu w koszyku
    if str(flower.flower_id) in cart:
        cart[str(flower.flower_id)]['quantity'] += quantity
    else:
        cart[str(flower.flower_id)] = {
            'name': flower.flower_name,
            'price': flower.price,
            'quantity': quantity
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



from random import randint
from datetime import datetime, timedelta
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Customer, Individual, Firm, Order, Delivery, OrderFlower, Flower, PaymentType, DeliveryName, Status, Employee

def checkout(request):
    cart = request.session.get('cart', {})
    flowers = Flower.objects.filter(flower_id__in=cart.keys())
    cart_items = [{'flower': flower, 'quantity': cart[str(flower.flower_id)]['quantity']} for flower in flowers]
    total_price = sum(item['flower'].price * item['quantity'] for item in cart_items)

    if request.method == 'POST':
        # Step 1: Gather form inputs
        user_type = request.POST.get('user_type')
        payment_type_id = request.POST.get('payment_type')
        delivery_name_id = request.POST.get('delivery_name')
        contact = request.POST.get('contact')
        address = request.POST.get('address')

        # Step 2: Create or associate a Customer
        customer = Customer.objects.create(
            customer_contact=contact,
            address=address
        )

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

        # Step 3: Assign a random Employee (1-15)
        employee = Employee.objects.order_by('?').first()

        # Step 4: Create the Delivery instance
        delivery_date = datetime.now() + timedelta(days=3)
        delivery = Delivery.objects.create(
            delivery_data=delivery_date,
            delivery_name_id=delivery_name_id,
            status=Status.objects.get(status_id=2)  # For example, "Paid" status
        )

        # Step 5: Create the Order and link with Delivery
        order = Order.objects.create(
            total_amount=total_price,
            customer=customer,
            employee=employee,
            delivery=delivery,
            payment_type_id=payment_type_id
        )

        # Step 6: Add flowers to OrderFlower
        for item in cart_items:
            OrderFlower.objects.create(
                order=order,
                flower=item['flower'],
                quantity=item['quantity']
            )

        # Clear the cart and confirm order
        request.session['cart'] = {}
        messages.success(request, "Your order has been placed successfully!")
        return redirect('home')

    # Prepare data for the template
    payment_types = PaymentType.objects.all()
    delivery_names = DeliveryName.objects.all()
    return render(request, 'shop_app/checkout.html', {
        'cart_items': cart_items,
        'total_price': total_price,
        'payment_types': payment_types,
        'delivery_names': delivery_names
    })
def order_confirmation(request, order_id):
    return HttpResponse(f"Order placed successfully! Your order number is {order_id}.")

