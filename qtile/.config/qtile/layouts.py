from libqtile import layout

layouts = [
    layout.Columns(border_width=1,
                   insert_position=1,
                   border_focus=["#7b2cbf"],
                   margin=4,
                   grow_amount=2),
    layout.Max(),
]
