from django.shortcuts import render, get_object_or_404, redirect
from .models import Flower
from datetime import timedelta, datetime

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
    return render(request, 'shop_app/cart.html', {'cart_items': cart_items, 'total_price': total_price})
def remove_from_cart(request, flower_id):
    cart = request.session.get('cart', {})
    if str(flower_id) in cart:
        del cart[str(flower_id)]
        request.session['cart'] = cart
    return redirect('cart')
