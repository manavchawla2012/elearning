from django.shortcuts import render
from .models import Products, Offers
from Forms.new_product import CreateProduct
from datetime import datetime
from django.shortcuts import redirect
from django.contrib import messages
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required
# Create your views here.


@require_http_methods(["GET", "POST"])
@login_required(redirect_field_name='/')
def new(request):
    if request.method == "GET":
        form = CreateProduct()
        return render(request, "Product/new.html", {"form": form})
    elif request.method == "POST":
        form = CreateProduct(request.POST)
        if form.is_valid():
            name = form.cleaned_data["name"]
            price = form.cleaned_data["price"]
            offer = form.cleaned_data["offer"]
            current_date = datetime.now()
            product = Products(name=name, price=price, offer=offer, created_at=current_date, updated_at=current_date)
            product.save()
            return redirect("/product/new", messages.success(request, "Product added Successfully"))
        else:
            return redirect("/product/new", messages.error(request, "Some Error Please Check"))


