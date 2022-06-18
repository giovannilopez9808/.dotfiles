from libqtile.config import Group, Key
from keys import keys,super_key
from libqtile.lazy import lazy

groups = [Group(i)
          for i in "123456789"]

# Move in workspaces
keys.extend([
    Key([super_key],
        "Right",
        lazy.screen.next_group(),
        desc="Move to next workspace"),
    Key([super_key],
        "Left",
        lazy.screen.prev_group(),
        desc="Move to previous workspace"),
])

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


