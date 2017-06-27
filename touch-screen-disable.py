from sys import stdin

lines = stdin.readlines()

res = None

for line in lines:
    line = line.strip()
    if "USBest Technology SiS HID Touch Controller" in line:
        for word in line.split():
            if "id=" in word:
                res = word.split("=")[1]

if res != None:
    print(res)
