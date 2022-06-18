from libqtile import layout

# color_border = ['#370617',
# '#370617']
# width_border=0.01
layouts = [
    layout.Columns(border_focus_stack=0,
                   border_width=0),
    # layout.Columns(),
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(border_focus_stack=color_border,
    # border_width=width_border),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
