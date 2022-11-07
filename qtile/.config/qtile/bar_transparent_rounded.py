from libqtile.widget.groupbox import GroupBox
from laptopbattery import LaptopBatteryWidget
from libqtile.widget.spacer import Spacer
from libqtile.widget.volume import Volume
from libqtile.widget.clock import Clock
from libqtile.widget.wlan import Wlan
from libqtile.bar import Bar
from unicodes import (
    left_half_circle,
    right_half_circle
)
from colors import (
    gruvbox,
    nord_fox
)
bar = Bar([
    Spacer(length=10),
    # Reloj
    left_half_circle(gruvbox['cyan']),
    Clock(
        background=gruvbox['cyan'],
        format=' %Y-%m-%d %I:%M %p'),
    right_half_circle(gruvbox['cyan']),
    # Volumen
    left_half_circle(nord_fox['blue']),
    Volume(fmt='墳 {}',
           background=nord_fox['blue']),
    right_half_circle(nord_fox['blue']),
    Spacer(length=420),
    # Grupos de ventanas
    left_half_circle(gruvbox['bg']),
    GroupBox(
        disable_drag=True,
        active=gruvbox['gray'],
        inactive=gruvbox['dark-gray'],
        highlight_method='line',
        block_highlight_text_color=gruvbox['magenta'],
        borderwidth=0,
        highlight_color=gruvbox['bg'],
        background=gruvbox['bg']
    ),
    right_half_circle(gruvbox['bg']),
    Spacer(length=440),
    # Bateria
    LaptopBatteryWidget(),
    # Internet
    left_half_circle(gruvbox['magenta']),
    Wlan(background=gruvbox["magenta"],
         format=" {essid} {percent:2.0%}"),
    right_half_circle(gruvbox['magenta']),
],
    # margin=[5, 5, 5, 5],
    background='#282a36',
    opacity=0.92,
    size=20,
)
