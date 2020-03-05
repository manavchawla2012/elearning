from django import template

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
