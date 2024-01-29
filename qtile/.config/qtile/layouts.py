from colors import get_dracula_theme
from libqtile import layout


def get_layouts() -> list:
    dracula = get_dracula_theme()
    layouts = [
        layout.Columns(
            border_width=1,
            insert_position=1,
            border_focus=[dracula["purple"]],
            margin=0,
            grow_amount=2
        ),
        layout.Max(),
    ]
    return layouts
