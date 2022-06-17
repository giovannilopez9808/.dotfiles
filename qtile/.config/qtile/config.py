from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile import bar, layout, widget
from bar_transparent_rounded import bar
from keys import keys,super_key
from libqtile.lazy import lazy
from colors import gruvbox
from os import system

groups = [Group(i)
          for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [super_key],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [super_key, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

color_border = ['#370617',
                '#370617']
width_border=1
layouts = [
    layout.Columns(border_focus_stack=color_border,
                   border_width=width_border),
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(border_focus_stack=color_border,
    # border_width=width_border),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=1,
)
extension_defaults = widget_defaults.copy()

# screens = [
# Screen(
# bottom=bar.Bar(
# [
# widget.CurrentLayout(),
# widget.GroupBox(),
# widget.Prompt(),
# #widget.WindowName(),
# widget.Chord(
# chords_colors={
# "launch": ("#ff0000", "#ffffff"),
# },
# name_transform=lambda name: name.upper(),
# ),
# #widget.TextBox("default config", name="default"),
# #widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
# # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
# # widget.StatusNotifier(),
# widget.Systray(),
# widget.Clock(format="%Y-%m-%d %I:%M %p"),
# #widget.QuickExit(),
# ],
# 12,
# # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
# # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
# ),
# ),
# ]

screens = [Screen(top=bar)]

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
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
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
wmname = "LG3D"


autostart =[
    'setxkbmap latam',
    'feh --bg-fill /home/amadeus/.config/qtile/wallpaper.jpg',
    'picom --no-vsync &'
]

for command in autostart:
    system(command)
