from os import popen


def set_monitors()->None:
    output = popen('xrandr').readlines()
    output = "".join(output)
    words = output.split()
    count = 0
    for word in words:
        if "connected" == word:
            count += 1
    if count == 1:
        return "~/.monitor/home_monitor_off"
    return "~/.monitor/home_monitor_on"




if __name__ == "__main__":
    command = set_monitors()
    print(command)
