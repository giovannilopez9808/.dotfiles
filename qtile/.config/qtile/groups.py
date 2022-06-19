from libqtile.config import Group, Key
from keys import keys, super_key
from libqtile.lazy import lazy
from libqtile import qtile


def define_groups() -> dict:
    Groups_name = [number
                   for number in "123456789"]
    groups = dict()
    for j, number in enumerate(Groups_name):
        i = j-1
        k = j+1
        if i < 0:
            i = len(Groups_name)-1
        if k == len(Groups_name):
            k = 0
        groups[number] = {
            "next": k,
            "prev": i,
        }
    return groups


# def move_window_to_screen(qtile, window, screen):
    # """Moves a window to a screen and focuses it, allowing you to move it
    # further if you wish."""
    # window.togroup(screen.group.name)
    # qtile.focus_screen(screen.index)
    # screen.group.focus(window, True)


# @lazy.function
# def move_window_to_next_screen(qtile):
    # """Moves a window to the next screen. Loops around the beginning and
    # end."""
    # index = qtile.current_group.name
    # logger.warning(f"Current group {index}")
    # index = qtile.current_screen.index
    # logger.warning(f"Current window {index}")
    # index = index + 1 if index < len(qtile.screens) - 1 else 0
    # logger.warning(f"To window {index}")
    # move_window_to_screen(qtile, qtile.current_window, qtile.screens[index])


@lazy.function
def displace_windows(qtile, groups_info: dict, move: str):
    # Current workspace
    index = qtile.current_group.name
    # Update workspace
    move_group = groups_info[index][move]
    move_group = qtile.groups[move_group]
    # Move windows
    qtile.current_window.togroup(move_group.name)
    # Move workspace
    qtile.current_screen.set_group(move_group)


groups_info = define_groups()
groups = [Group(i)
          for i in groups_info]
keys.extend(
    [
        # Move in workspaces
        Key([super_key],
            "Down",
            lazy.screen.next_group(),
            desc="Move to next workspace"),
        Key([super_key],
            "Up",
            lazy.screen.prev_group(),
            desc="Move to previous workspace"),
        # Move windows to another workspace
        Key([super_key, "shift"],
            "Down",
            displace_windows(groups_info,
                             "next"),
            desc="Move window to next workspace"),
        Key([super_key, "shift"],
            "Up",
            displace_windows(groups_info,
                             "prev"),
            desc="Move window to previous workspace"),
    ]
)

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
        ]
    )
