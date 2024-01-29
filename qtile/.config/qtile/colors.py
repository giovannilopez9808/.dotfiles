from datetime import datetime


def get_wallpaper() -> str:
    today = datetime.today()
    if 7 < today.hour < 19:
        character = "kazuha"
    else:
        character = "raiden"
    return character


def get_keyboard_color() -> str:
    today = datetime.today()
    command = "msi-perkeyrgb --model GS65 -s"
    if 7 < today.hour < 19:
        color = f"{command} edf6f9"
    else:
        color = f"{command} 343ed9"
    return color


def get_dracula_theme() -> dict:
    dracula = {
        "backgroud": "#282a36",
        "current-line": "#44475a",
        "selection": "#44475a",
        "foreground": "#f8f8f2",
        "comment": "#6272a4",
        "cyan": "#8be9fd",
        "green": "#50fa7b",
        "orange": "#ffb86c",
        "pink": "#ff79c6",
        "purple": "#bd93f9",
        "red": "#ff5555",
        "yellow": "#f1fa8c",
    }
    return dracula
