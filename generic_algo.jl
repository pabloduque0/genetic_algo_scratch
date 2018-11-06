
num_generations = 100
population = []
fitness_function = func
parent_selection =

for gen in range(num_generations)
    evaluate_all_fitness!(population, fitness_func, eval_on="phenotype")
    parents = selection_by_rank(population)
    two_point_xover(parents)
end
