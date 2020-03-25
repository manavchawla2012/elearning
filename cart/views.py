from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
from .models import Cart
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from datetime import datetime
from products.models import Offers


# Create your views here.


@require_http_methods(["POST"])
@csrf_exempt
def add(request):
    if request.method == "POST":
        data = request.POST
        user = request.user
        if user.id:
            user_id = user.id
            product_id = data["productId"]
            item_exist = check_product_already_active(user_id, product_id)
            if not item_exist:
                cart_item = Cart(quantity=1, is_active=1, updated_at=datetime.now(),
                                 product_id=product_id, user_id=user_id)
                cart_item.save()
            else:
                quantity = item_exist.first().quantity
                item_exist.update(quantity=quantity + 1, updated_at=datetime.now())
            return JsonResponse({"success": True})
        else:
            return JsonResponse({"success": False, "redirect": "/login"})


@require_http_methods(["GET"])
def view(request):
    if request.method == "GET":
        products = {}
        user = request.user
        user_id = user.id
        if user_id:
            get_cart_data = Cart.objects.filter(user=user_id, is_active=1).order_by("-product__price")
            cart_data = get_cart_data
            for data in cart_data:
                if data.product.offer_id not in products:
                    products[data.product.offer_id] = []

                offer_id = data.product.offer_id
                products[offer_id].append({"product-id": data.product_id, "quantity": data.quantity,
                                           "product-price": data.product.price})

            price, discount = calculate_final_price(products)
            final_price = price - discount
            data = {
                "price": price,
                "discount": discount,
                "final_price": final_price
            }

            user = True
        else:
            data = {}
            cart_data = None
            user = False

        return render(request, "Product/cart.html", {"user": user, "cart": cart_data, **data})


def check_product_already_active(user_id, product_id):
    item_exist = Cart.objects.filter(user=user_id, product=product_id, is_active=1)
    if item_exist:
        return item_exist
    else:
        return None


def calculate_final_price(offers):
    print(offers)
    price = 0
    discount = 0
    for offer in offers:
        if offer is None:
            for product in offers[None]:
                price = price + (product["product-price"] * product["quantity"])
        else:
            offer_id = offer
            array = []
            offer_details = Offers.objects.filter(pk=offer_id).first()
            min_buy = offer_details.min_buy
            free_items = offer_details.free_items
            for product in offers[offer_id]:
                array = push_value(array, product["product-price"], product["quantity"])
            array.sort()
            while array is not None:
                if array:
                    for x in range(0, min_buy):
                        if not array:
                            break
                        else:
                            price = price + array[-1]
                            array.pop(-1)
                    if array:
                        if not array:
                            break
                        else:
                            for x in range(0, free_items):
                                if not array:
                                    break
                                else:
                                    price = price + array[0]
                                    discount = discount + array[0]
                                    array.pop(0)
                else:
                    break
    return price, discount


def push_value(price, value, time):
    for x in range(0, time):
        price.append(value)
    return price
