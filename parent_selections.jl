
function selection_by_rank(population, s=1.5)
    if s > 2 || s < 1
        throw(ArgumentError("argument must be nonnegative"))
    end
    μ = length(population)
    selected_parents = []
    for (index, entity) in enumerate(population)
        index -= 1
        sorted_populations = sort(population, by=i->i.fitness)
        probability = ((2-s) / μ) + ((2 * index)(s-1))((μ * (μ - 1)))
        random_num = rand(Float16, 1)[1]
        if random_numb <= probability
            push!(elected_parents, entity)
    end

end
