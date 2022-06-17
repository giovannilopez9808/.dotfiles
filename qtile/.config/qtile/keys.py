from libqtile.config import Key
from libqtile.lazy import lazy
import subprocess


def backlight(action):
    def f(qtile):
        brightness = int(subprocess.run(['xbacklight',
                                         '-get'],
                                        stdout=subprocess.PIPE).stdout)
        decision1 = brightness != 1 or action != 'dec'
        if decision1:
            decision2 = brightness > 49 and action == 'dec'
            decision3 = brightness > 39 and action == 'inc'
            if decision2 or decision3:
                subprocess.run(['xbacklight',
                                f'-{action}',
                                '10'])
            else:
                subprocess.run(['xbacklight',
                                f'-{action}',
                                '1'])
    return f

super_key = "mod4"
alt = 'mod1'
terminal = '/bin/kitty'
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([super_key],
        "Left",
        lazy.layout.left(),
        desc="Move focus to left"),
    Key([super_key],
        "Right",
        lazy.layout.right(),
        desc="Move focus to right"),
    Key([super_key],
        'Down',
        lazy.layout.down(),
        desc="Move focus down"),
    Key([super_key],
        "Up",
        lazy.layout.up(),
        desc="Move focus up"),
    Key([super_key],
        "space",
        lazy.layout.next(),
        desc="Move window focus to other window"),
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
    lazy.spawn('rofi -lines 10 -padding 0 -show search -show-icons -modi search:/bin/rofi-web-search.py -i -p "Search : "'),
    desc='Open rofi search'),
Key([alt],
    'q',
    lazy.spawn('rofi -lines 10 -padding 0 -show scihub -show-icons -modi scihub:/bin/rofi_scihub.py -i -p "SciHub: "'),
    desc='Open rofi scihub help'),
Key([],
    'XF86MonBrightnessUp',
    lazy.spawn('xbacklight -inc 5')),
Key([],
    'XF86MonBrightnessDown',
    lazy.spawn('xbacklight -dec 5')),
]


