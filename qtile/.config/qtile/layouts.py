from libqtile import layout
from colors import dracula

layouts = [
    layout.Columns(border_width=1,
                   insert_position=1,
                   border_focus=[dracula["purple"]],
                   margin=4,
                   grow_amount=2),
    layout.Max(),
]
