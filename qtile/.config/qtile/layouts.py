from libqtile import layout

layouts = [
    layout.Columns(border_width=1,
                   border_focus_stack=["#d75f5f",
                                       "#d75f5f"],
                   grow_amount=5),
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
