
# names = eval(input('enter array of students" names: '))
# assignments = eval(input('enter array of the no. of assignments: '))
# grades = eval(input('enter array of grades: '))

# for i, name in enumerate(names):
#   print (f"\nHi {name},\n\nThis is a reminder that you have {assignments[i]} assignments left to submit before you can graduate.\nYour current grade is {grades[i]} and can increase to {grades[i] + (2 * assignments[i])} if you submit all assignments before the due date\n\n")


names = input("Enter names separated by commas: ").title().split(",")
assignments = input("Enter assignment counts separated by commas: ").split(",")
grades = input("Enter grades separated by commas: ").split(",")
message = "Hi {},\n\nThis is a reminder that you have {} assignments left to \n submit before you can graduate. You're current grade is {} and can increase \nto {} if you submit all assignments before the due date.\n\n"
for name, assignment, grade in zip(names, assignments, grades):
  print(message.format(name, assignment, grade, int(grade) + int(assignment) * 2))
