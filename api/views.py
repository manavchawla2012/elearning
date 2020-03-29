from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import decorators
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
from User.models import ActivityPeriod, Users
from datetime import datetime
from django.contrib.sessions.models import Session
from pytz import timezone


# Create your views here.


@csrf_exempt
@require_http_methods(["GET", "POST"])
@decorators.check_api_key
def get_user_details(request):
    current_time = datetime.now(timezone("utc"))
    result = {"ok": True, "members": []}
    users = Users.objects.all()
    for user in users:
        user_name = user.first_name + " " + user.last_name
        user_id = user.pk
        tz = "UTC"
        activity_period = []
        user_activities = ActivityPeriod.objects.filter(user_id=user.pk)
        for activity in user_activities:
            if not activity.expire_time:
                expire_date = Session.objects.filter(session_key=activity.session_id).first().expire_date
            else:
                expire_date = activity.expire_time
            activity_period.append({"start_time": activity.log_in_time,
                                    "end_time": "Is Active" if expire_date > current_time else expire_date})
        result["members"].append({"Id": user_id, "real_name": user_name, "timezone": tz,
                                  "activity_periods": activity_period})

    return JsonResponse(result)
