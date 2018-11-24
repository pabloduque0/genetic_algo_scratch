module SurvivalSelection

    function age_based_selection(population, elitism=false)
        next_generation = nothing
        population = sort(population, by=i->i.age)
        if elitism
            fittest = select_single_best(population)
            push!(next_generation, fittest)
        end

    end


    function select_single_best(population)
        fittest = sort(population, by=i->i.fitness)[end]
        print("FITTEST: ", fittest)
        return fittest
    end

end
