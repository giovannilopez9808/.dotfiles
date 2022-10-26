from libqtile import layout

layouts = [
    layout.Columns(border_width=1,
                   insert_position=1,
                   border_focus=["#7b2cbf"],
                   grow_amount=2),
    # layout.Max(),
    # layout.Columns(),
    # layout.Columns(border_focus_stack=["#d75f5f",
    # "#8f3d3d"], border_width = 4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(border_focus_stack=["#d75f5f"],
    # border_width=10),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
