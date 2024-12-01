from django.contrib.auth.models import User
from django.shortcuts import render, get_object_or_404, redirect
from .models import Flower, Individual, Firm, Customer, OrderFlower, Order
from datetime import timedelta, datetime
from django.contrib import messages


def home(request):
    flowers = Flower.objects.all()
    view_type = request.GET.get('view', 'grid')  # Domyślnie siatka
    return render(request, 'shop_app/home.html', {'flowers': flowers, 'view_type': view_type})
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

    if request.method == 'POST':
        flower_id = request.POST.get('flower_id')
        new_quantity = request.POST.get('quantity')

        # Aktualizowanie ilości kwiatów
        if new_quantity:
            cart[str(flower_id)]['quantity'] = int(new_quantity)
            request.session['cart'] = cart

    return render(request, 'shop_app/cart.html', {'cart_items': cart_items, 'total_price': total_price})


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
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = User.objects.create_user(username=username, password=password)
        customer = Customer.objects.create(customer_contact=request.POST.get('contact'), address=request.POST.get('address'))

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

        return redirect('home')

    return render(request, 'shop_app/register.html')
def checkout(request):
    cart = request.session.get('cart', {})
    flowers = Flower.objects.filter(flower_id__in=cart.keys())
    cart_items = [{'flower': flower, 'quantity': cart[str(flower.flower_id)]} for flower in flowers]
    total_price = sum(item['flower'].price * item['quantity'] for item in cart_items)

    if request.method == 'POST':
        # Stworzenie zamówienia
        customer = request.user.customer
        order = Order.objects.create(customer=customer, total_amount=total_price)

        # Dodanie kwiatów do zamówienia
        for item in cart_items:
            OrderFlower.objects.create(order=order, flower=item['flower'], quantity=item['quantity'])

        # Po zapisaniu zamówienia, usunięcie koszyka
        request.session['cart'] = {}

        return redirect('home')

    return render(request, 'shop_app/checkout.html', {'cart_items': cart_items, 'total_price': total_price})
