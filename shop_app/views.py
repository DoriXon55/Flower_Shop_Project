from django.shortcuts import redirect, render, get_object_or_404
from .models import CartItem, Flower, Order
from django.contrib.auth.decorators import login_required

def home(request):
    flowers = Flower.objects.all()
    return render(request, 'shop_app/home.html', {'flowers': flowers})
def flower_detail(request, flower_id):
    flower = get_object_or_404(Flower, pk=flower_id)
    return render(request, 'shop_app/flower_detail.html', {'flower': flower})
def cart_view(request):
    cart = request.session.get('cart', {})
    flowers = Flower.objects.filter(id__in=cart.keys())
    cart_items = [{'flower': flower, 'quantity': cart[str(flower.id)]} for flower in flowers]

    total_price = sum(item['flower'].price * item['quantity'] for item in cart_items)
    return render(request, 'shop_app/cart.html', {'cart_items': cart_items, 'total_price': total_price})
def add_to_cart(request, flower_id):
    cart = request.session.get('cart', {})
    cart[str(flower_id)] = cart.get(str(flower_id), 0) + 1
    request.session['cart'] = cart
    return redirect('cart_view')

def checkout(request):
    cart = request.session.get('cart', {})
    if not cart:
        return redirect('home')

    flowers = Flower.objects.filter(id__in=cart.keys())
    total_price = sum(flower.price * cart[str(flower.id)] for flower in flowers)

    order = Order.objects.create(user=request.user, total_price=total_price, payment_status='pending')
    for flower in flowers:
        CartItem.objects.create(order=order, flower=flower, quantity=cart[str(flower.id)])

    del request.session['cart']
    return render(request, 'shop_app/checkout.html', {'order': order})

