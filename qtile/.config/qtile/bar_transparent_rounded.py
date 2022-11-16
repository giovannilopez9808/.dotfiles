from libqtile.widget.groupbox import GroupBox
from laptopbattery import LaptopBatteryWidget
from libqtile.widget.spacer import Spacer
from libqtile.widget.volume import Volume
from libqtile.widget.clock import Clock
from libqtile.widget.wlan import Wlan
from libqtile.bar import Bar
from colors import dracula
from unicodes import (
    left_half_circle,
    right_half_circle
)
bar = Bar([
    Spacer(length=5),
    # Reloj
    left_half_circle(dracula['purple']),
    Clock(
        background=dracula["purple"],
        format=' %Y-%m-%d %H:%M %p'),
    right_half_circle(dracula['purple']),
    # Volumen
    left_half_circle(dracula['comment']),
    Volume(fmt='墳 {}',
           background=dracula['comment']),
    right_half_circle(dracula['comment']),
    Spacer(length=615),
    # Grupos de ventanas
    left_half_circle(dracula['backgroud']),
    GroupBox(
        disable_drag=True,
        active=dracula['comment'],
        inactive=dracula['current-line'],
        highlight_method='line',
        block_highlight_text_color=dracula['purple'],
        borderwidth=0,
        highlight_color=dracula['backgroud'],
        background=dracula['backgroud']
    ),
    right_half_circle(dracula['backgroud']),
    Spacer(length=660),
    # Bateria
    LaptopBatteryWidget(),
    # Internet
    left_half_circle(dracula['selection']),
    Wlan(background=dracula["selection"],
         format=" {essid} {percent:2.0%}"),
    right_half_circle(dracula['selection']),
],
    background=dracula["backgroud"],
    opacity=0.9,
    size=20,
)
