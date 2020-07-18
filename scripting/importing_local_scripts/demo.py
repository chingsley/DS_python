import useful_functions as uf

scores = [88, 92, 79, 93, 85]

mean = uf.mean(scores)
curved = uf.add_five(scores)

mean_c = uf.mean(curved)

print("scores: ", scores)
print("Original mean: ", mean, "\nNew meain: ", mean_c)


print(__name__)
print(uf.__name__)
