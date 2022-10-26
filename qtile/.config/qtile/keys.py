from libqtile.config import Key
from libqtile.lazy import lazy


def window_to_previous_screen(qtile, switch_group=False, switch_screen=True):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i - 1)


def window_to_next_screen(qtile, switch_group=False, switch_screen=True):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i + 1)


super_key = "mod4"
alt = 'mod1'
terminal = '/bin/alacritty'
ss_command = "scrot '%Y-%m-%d-%H-%s_screenshot.png' -s --freeze -e"
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key(["control"],
        "Left",
        lazy.layout.left(),
        desc="Move focus to left"),
    Key(["control"],
        "Right",
        lazy.layout.right(),
        desc="Move focus to right"),
    Key(["control"],
        'Down',
        lazy.layout.down(),
        desc="Move focus down"),
    Key(["control"],
        "Up",
        lazy.layout.up(),
        desc="Move focus up"),
    # Key(["control"],
    # "space",
    # lazy.layout.next(),
    # desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([super_key, "shift"],
        "Left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([super_key, "shift"], "Right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([super_key, "shift"],
        "Down",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([super_key, "shift"],
        "Up",
        lazy.layout.shuffle_up(),
        desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([super_key, "control"],
        "Left",
        lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([super_key, "control"],
        "Right",
        lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([super_key, "control"],
        "Down",
        lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([super_key, "control"],
        "Up",
        lazy.layout.grow_up(),
        desc="Grow window up"),
    Key([super_key],
        "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([super_key, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
        ),
    Key(['control'],
        "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([super_key],
        "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"),
    Key([super_key],
        "q",
        lazy.window.kill(),
        desc="Kill focused window"),
    Key([super_key, "control"],
        "r",
        lazy.reload_config(),
        desc="Reload the config"),
    Key([super_key, "control"],
        "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"),
    Key([super_key],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key([super_key],
        'b',
        lazy.spawn('firefox'),
        desc='Open firefox'),
    Key([alt],
        'a',
        lazy.spawn('rofi -show drun -show-icons'),
        desc='Open rofi with applications'),
    Key([alt],
        's',
        lazy.spawn(
        'rofi -lines 10 -padding 0 -show Search -show-icons -modi Search:/bin/rofi-web-search.py -i -p "Search : "'),
        desc='Open rofi search'),
    Key([alt],
        'q',
        lazy.spawn(
        'rofi -lines 10 -padding 0 -show SciHub -show-icons -modi SciHub:/bin/rofi_scihub.py -i -p "SciHub: "'),
        desc='Open rofi scihub help'),
    Key([],
        'XF86MonBrightnessUp',
        lazy.spawn('brightnessctl set 2%+'),
        desc="Increase ligthness"),
    Key([],
        'XF86MonBrightnessDown',
        lazy.spawn('brightnessctl set 2%-'),
        "Descrease ligthness"),
    Key([],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl -- set-sink-volume @DEFAULT_SINK@ +2%"),
        ),
    Key([],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl -- set-sink-volume @DEFAULT_SINK@ -2%"),
        ),
    Key(["control"],
        "h",
        lazy.hide_show_bar("top"),
        desc="Hide top bar"),
    Key([super_key],
        "f",
        lazy.spawn("thunar"),),
    Key([super_key, "shift"],
        "Print",
        lazy.spawn(
            f"{ss_command} 'xclip -selection clipboard -t image/png -i $f && rm *.png'")
        ),
    Key([super_key],
        "Print",
        lazy.spawn(f"{ss_command} 'mv *.png ~/Pictures/'")),
    Key([super_key],
        "Left",
        lazy.to_screen(0)),
    Key([super_key],
        "Right",
        lazy.to_screen(1)),
    Key([super_key, alt],
        "Right",
        lazy.function(window_to_next_screen)),
    Key([super_key, alt],
        "Left",
        lazy.function(window_to_previous_screen)),
]
