from libqtile.lazy import lazy
from libqtile.config import (
    Group,
    Key
)
from keys import (
    super_key,
    get_keys,
)


def define_groups() -> dict:
    groups = list("123456789")
    Groups_name = [
        number
        for number in groups
    ]
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


@lazy.function
def displace_windows(
        qtile,
        groups_info: dict,
        move: str
):
    # Current workspace
    index = qtile.current_group.name
    # Update workspace
    move_group = groups_info[index][move]
    move_group = qtile.groups[move_group]
    # Move windows
    qtile.current_window.togroup(move_group.name)
    # Move workspace
    qtile.current_screen.set_group(move_group)


def get_all_keys():
    keys = get_keys()
    groups_info = define_groups()
    groups = [
        Group(i)
        for i in groups_info
    ]
    keys.extend(
        [
            # Move in workspaces
            Key(
                [super_key],
                "Down",
                lazy.screen.next_group(),
                desc="Move to next workspace"
            ),
            Key(
                [super_key],
                "Up",
                lazy.screen.prev_group(),
                desc="Move to previous workspace"
            ),
            # Move windows to another workspace
            Key(
                [super_key, "shift"],
                "Down",
                displace_windows(
                    groups_info,
                    "next"
                ),
                desc="Move window to next workspace"
            ),
            Key(
                [
                    super_key,
                    "shift"
                ],
                "Up",
                displace_windows(
                    groups_info,
                    "prev"
                ),
                desc="Move window to previous workspace"
            ),
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
    return keys
