include("./crossover.jl")
include("./fitnessfunctions.jl")
include("./mutation.jl")
include("./parent_selections.jl")
include("./population.jl")
include("./survival_selection.jl")

using .Crossover, .FitnessFunctions, .Mutation, .ParentSelection, .Population, .SurvivalSelection
using Statistics, Plots

num_generations = 100

population_size = 100
number_genes = 64
variable_range = (-10, 10)
population = Population.generate_population(population_size, number_genes, variable_range)
fitness_function = FitnessFunctions.sphere

fitness_evaluation = []
for gen in 1:num_generations
    #println("Initial population: ", population[1])
    FitnessFunctions.evaluate_all_fitness!(population, fitness_function, "phenotype")
    parents = ParentSelection.selection_by_rank(population)
    #println("Mid state: ", parents[1])
    offspring = Crossover.generate_offspring(parents, Crossover.two_point_xover)
    Mutation.perform_all_mutations!(offspring, Mutation.binary_mutation)

    fittest = SurvivalSelection.select_single_best(population)
    offspring = push!(offspring, fittest)
    deleteat!(offspring, 1)
    global population = offspring
    #println("Final: ", population[1])
    fitness_values = [e.fitness for e in population]
    #println(fitness_evaluation)
    push!(fitness_evaluation, mean(fitness_values))

end
#print(fitness_evaluation)
#plot(1:num_generations, fitness_evaluation)
