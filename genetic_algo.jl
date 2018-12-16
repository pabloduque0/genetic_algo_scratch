include("./crossover.jl")
include("./fitnessfunctions.jl")
include("./mutation.jl")
include("./parent_selections.jl")
include("./population.jl")
include("./survival_selection.jl")
include("./utils.jl")
using .Crossover, .FitnessFunctions, .Mutation, .ParentSelection, .Population, .SurvivalSelection, .Utils
using Statistics, Plots

num_generations,  population_size, number_genes, variable_range, function_param = Utils.get_algo_params()

population = Population.generate_population(population_size, number_genes,
                                            variable_range, false)
fitness_function = nothing
if function_param == "sphere"
    fitness_function = FitnessFunctions.sphere
elseif function_param == "schwefel"
    fitness_function = FitnessFunctions.schwefel
end

fitness_evaluation_mean = []
fitness_evaluation_best = []
mutations_levels = []
for gen in 1:num_generations
    FitnessFunctions.evaluate_all_fitness!(population, fitness_function, "phenotype")
    parents = ParentSelection.selection_by_rank(population)
    offspring = Crossover.generate_offspring(parents, Crossover.two_point_xover)
    mutation_level = Mutation.perform_all_mutations!(offspring, Mutation.binary_mutation)
    push!(mutations_levels, mean(mutation_level))
    fittest = SurvivalSelection.select_single_best(population)
    offspring = push!(offspring, fittest)
    deleteat!(offspring, 1)
    global population = offspring
    fitness_values = [e.fitness for e in population]
    push!(fitness_evaluation_mean, mean(fitness_values))
    push!(fitness_evaluation_best, fittest.fitness)

end

plot!(1:num_generations, [fitness_evaluation_mean, fitness_evaluation_best], lw=3, layout=(1, 2))
