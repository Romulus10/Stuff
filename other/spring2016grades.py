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

print("Sean Batzel Intelligent Grade Prediction for Spring Semester of 2016")
print()
print()
print()
#If I failed PreCalc.
dgrades = []
current = 86
print("Data Structures: ")
for x in range(0,101):
    final = (current * .75) + (x * .25)
    print(str(x) + ": " + str(final))
    dgrades.append(final)
print("*************")
print()
    
mgrades = []
current = 81
print("Masters of Darkness: ")
for x in range(0,101):
    final = (current * .66) + (x * .33)
    print(str(x) + ": " + str(final))
    mgrades.append(final)
print("*************")
print()

ogrades = []
quiz = 83
midterm = 91
homework = 90
print("Machine Organization: ")
for x in range(0,101):
    final = (homework * .40) + (midterm * .25) + (quiz * .10) + (x * .25)
    print(str(x) + ": " + str(final))
    ogrades.append(final)
print("*************")
print()

pgrades = []
for x in range(0,101):
    pgrades.append(0)

tgrades = []
for x in range(0,101):
    tgrades.append(91.7)

gpa = []
for x in range(0,101):
    avg = (dgrades[x] + mgrades[x] + ogrades[x] + pgrades[x] + tgrades[x])/5
    gpanum = find_gpa(avg)
    gpa.append(gpanum)
    print(gpanum)
print("*************")
print()

probablegpas = []
for x in range(0,101):
    print((gpa[x]+3.45)/2)
    if ((gpa[x]+3.45)/2 < 3.25):
        print("\tScholarship lost at this point.")
    probablegpas.append((gpa[x]+3.45)/2)
print("*************")

print("Minimum probable GPA: " + str(probablegpas[0]))
print()

#Calculate the average of the probablegpas list.
sum = 0
for x in probablegpas:
    sum = sum + x
avg = sum/len(probablegpas)
ififailed = avg

#If I didn't fail PreCalc.
dgrades = []
current = 86
print("Data Structures: ")
for x in range(0,101):
    final = (current * .75) + (x * .25)
    print(str(x) + ": " + str(final))
    dgrades.append(final)
print("*************")
print()
    
mgrades = []
current = 81
print("Masters of Darkness: ")
for x in range(0,101):
    final = (current * .66) + (x * .33)
    print(str(x) + ": " + str(final))
    mgrades.append(final)
print("*************")
print()

ogrades = []
quiz = 83
midterm = 91
homework = 90
print("Machine Organization: ")
for x in range(0,101):
    final = (homework * .40) + (midterm * .25) + (quiz * .10) + (x * .25)
    print(str(x) + ": " + str(final))
    ogrades.append(final)
print("*************")
print()

pgrades = []
for x in range(0,101):
    pgrades.append(73)

tgrades = []
for x in range(0,101):
    tgrades.append(91.7)

print("Average Semester GPAs.")
gpa = []
for x in range(0,101):
    avg = (dgrades[x] + mgrades[x] + ogrades[x] + pgrades[x] + tgrades[x])/5
    gpanum = find_gpa(avg)
    gpa.append(gpanum)
    print(gpanum)
print("*************")
print()

print("Average Final GPAs.")
probablegpas = []
for x in range(0,101):
    print((gpa[x]+3.45)/2)
    if ((gpa[x]+3.45)/2 < 3.25):
        print("\tScholarship lost at this point.")
    probablegpas.append((gpa[x]+3.45)/2)
print("*************")

print("Minimum probable GPA: " + str(probablegpas[0]))
print()

#Calculate the average of the probablegpas list.
sum = 0
for x in probablegpas:
    sum = sum + x
avg = sum/len(probablegpas)
ifididntfail = avg

print("If you FAILED PRECALCULUS:")
if ififailed < 3.25:
    print("You're probably hosed.")
else:
    print("Manageable if I'm counting correctly.")
print("Probable working GPA is " + str(ififailed) + ".")
print()

print("If you PASSED PRECALCULUS:")
if ifididntfail < 3.25:
    print("You're probably hosed.")
else:
    print("Manageable if I'm counting correctly.")
print("Probable working GPA is " + str(ifididntfail) + ".")
print()

probablecase = ((ififailed+ifididntfail)/2)
print("Most likely we're looking at something more like this:")
print("\t" + str(probablecase))
