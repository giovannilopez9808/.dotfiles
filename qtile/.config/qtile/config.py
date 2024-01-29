from bar_transparent_rounded import get_bar
from layouts import get_layouts
from libqtile.lazy import lazy
from libqtile.config import (
    Screen,
    Click,
    Match,
    Drag,
)
from libqtile import layout
from os import system
from groups import (
    get_all_keys,
    super_key,
)
from colors import (
    get_dracula_theme,
    get_keyboard_color,
    get_wallpaper,
)
widget_defaults = dict(
    font="MesloLGSNerdFont",
    fontsize=12,
    padding=1,
)
dracula = get_dracula_theme()
layouts = get_layouts()
keys = get_all_keys()
bar = get_bar()
extension_defaults = widget_defaults.copy()

screens = [
    Screen(top=bar),
    Screen(),
]

# Drag floating layouts.
mouse = [
    Drag([super_key],
         "Button1",
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([super_key],
         "Button3",
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([super_key],
          "Button2",
          lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X
        # client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="matplotlib")
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"

xinput = "xinput set-prop '{}' '{}' 1"
lenovo = "ALPS121E:00 044E:120A Touchpad"
hp = "SynPS/2 Synaptics TouchPad"
tap = "libinput Tapping Enabled"
scroll = "libinput Natural Scrolling Enabled"
msi = "CUST0001:00 06CB:CDAD Touchpad"
wallpaper_folder = "/home/altair/.dotfiles/qtile/.config/qtile/wallpapers/"
character = get_wallpaper()
color = get_keyboard_color()
autostart = [
    # LATAM keys
    'setxkbmap latam',
    # Select with touchpad
    # Lenovo
    xinput.format(msi,
                  tap),
    # HP
    # xinput.format(hp,
    # tap),
    # # Natural scrolling
    # Lenovo
    xinput.format(msi,
                  scroll),
    # HP
    # xinput.format(hp,
    # scroll),
    # Backgroud
    # "optimus-manager --switch nvidia",
    # 'feh --bg-fill /home/altair/.dotfiles/qtile/.config/qtile/call.png',
    color,
    f'feh --bg-fill {wallpaper_folder}{character}.jpg',
    # Transparency
    'picom &',
]

for command in autostart:
    system(command)
