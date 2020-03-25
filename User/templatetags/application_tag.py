from django import template
import random
import locale

register = template.Library()


@register.simple_tag
def get_name(user):
    name = ""
    name = name + user.first_name[0] + user.last_name[0]
    return name.upper()


@register.simple_tag
def get_full_name(user):
    name = "".capitalize()
    name = name + str(user.first_name).capitalize() + " " + str(user.last_name).capitalize()
    return name


@register.simple_tag
def get_cross_price(original_price):
    price = original_price - (original_price * random.randrange(10, 20) / 100)
    return price


@register.simple_tag
def get_rating():
    rating = random.randrange(2, 5, 1)
    return rating


@register.simple_tag
def calculate_price(price, quantity):
    locale.setlocale(locale.LC_ALL, '')
    return locale.currency(price * quantity, grouping=True)


@register.simple_tag
def currency(price):
    return locale.currency(price, grouping=True)
