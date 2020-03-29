from User.models import Users
from django.http import JsonResponse


def check_api_key(function):
    def wrap(request, *args, **kwargs):
        success, msg = _return_non_auth_user(request)
        if success:
            return function(request, *args, **kwargs)
        else:
            return JsonResponse({"success": False, "msg": msg})

    wrap.__doc__ = function.__doc__
    wrap.__name__ = function.__name__
    return wrap


def _return_non_auth_user(request):
    success = False
    if request.method == "GET":
        req_data = request.GET
        api_key = req_data["api_key"] if "api_key" in req_data else None
    elif request.method == "POST":
        req_data = request.headers
        api_key = req_data["api-key"] if "api-key" in req_data else None
    else:
        api_key = None
    if not api_key:
        if request.method == "POST":
            msg = "api-key not found."
        elif request.method == "GET":
            msg = "api_key not Found."
        else:
            msg = "Request not Valid"
    else:
        api_key_valid = Users.objects.filter(api_key=api_key).first()
        if api_key_valid:
            success = True
            msg = ""
        else:
            msg = "API key not valid"
    return success, msg
