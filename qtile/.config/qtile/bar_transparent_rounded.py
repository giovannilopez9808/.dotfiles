from unicodes import left_half_circle, right_half_circle
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.groupbox import GroupBox
from laptopbattery import LaptopBatteryWidget
from libqtile.widget.spacer import Spacer
from libqtile.widget.clock import Clock
from libqtile.widget.volume import Volume
from colors import gruvbox, nord_fox
from libqtile.widget import Wlan
from libqtile.bar import Bar


bar = Bar([
    # left_half_circle(gruvbox['blue']),
    # CurrentLayout(
    # background=gruvbox['blue'],
    # ),
    # right_half_circle(gruvbox['blue']),

    Spacer(length=0),

    # left_half_circle(gruvbox['magenta']),
    # WindowCount(
    # text_format='缾 {num}',
    # background=gruvbox['magenta'],
    # show_zero=True
    # ),
    # right_half_circle(gruvbox['magenta']),

    Spacer(length=10),

    left_half_circle(gruvbox['cyan']),
    Clock(
        background=gruvbox['cyan'],
        format=' %Y-%m-%d %I:%M %p'),
    right_half_circle(gruvbox['cyan']),

    Spacer(length=680),

    # Prompt(foreground=gruvbox['fg']),

    # WindowName(foreground=gruvbox['fg']),

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

    Spacer(length=620),

    # Systray(
    # padding=0,
    # # background='#00000000'
    # ),

    # Spacer(length=10),

    # left_half_circle(gruvbox['dark-cyan']),
    # CPU(
    # format=' {freq_current}GHz {load_percent}%',
    # background=gruvbox['dark-cyan']),
    # right_half_circle(gruvbox['dark-cyan']),

    # Spacer(length=10),

    # Memory(
    # format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
    # background=gruvbox['dark-magenta']),

    # Spacer(length=10),

    # left_half_circle(gruvbox['dark-blue']),
    # Net(
    # background=gruvbox['dark-blue']
    # ),
    # battery(),
    LaptopBatteryWidget(),
    left_half_circle(nord_fox['blue']),
    Volume(fmt='墳 {}',
           background=nord_fox['blue']),
    right_half_circle(nord_fox['blue']),
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
