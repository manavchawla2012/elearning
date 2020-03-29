from django.core.management.base import BaseCommand
from django.utils import timezone
from User.models import ActivityPeriod, Users


class Command(BaseCommand):
    help = 'Displays current time'

    def add_arguments(self, parser):
        parser.add_argument("--count", type=int)

    def handle(self, *args, **kwargs):
        None

