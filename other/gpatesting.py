def find_gpa(x):
    if x >= 94.00:
        return 4.00
    if x >= 90.00 and x < 94.00:
        return 3.67
    if x >= 87.00 and x < 91.00:
        return 3.33
    if x >= 84.00 and x < 87.00:
        return 3.00
    if x >= 80.00 and x < 84.00:
        return 2.67
    if x >= 77.00 and x < 80.00:
        return 2.33
    if x >= 73.00 and x < 77.00:
        return 2.00
    if x >= 0.00 and x < 73.00:
        return 0.00

for x in range(0,101):
    print(str(x) + ": " + str(find_gpa(x)))

x = 0
while x < 100:
    print(str(x) + ": " + str(find_gpa(x)))
    x += .01
