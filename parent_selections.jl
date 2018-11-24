module ParentSelection

    function selection_by_rank(population, s=1.5)
        if s > 2 || s < 1
            throw(ArgumentError("s argument must be in range [1, 2]"))
        end
        μ = length(population)
        selected_parents = []
        sorted_populations = sort(population, by=i->i.fitness)

        while length(selected_parents) != μ
            for (index, entity) in enumerate(sorted_populations)
                if length(selected_parents) == μ
                    break
                end
                probability = ((2-s) / μ) + (((2 * (index-1))*(s-1)) / ((μ * (μ - 1))))
                random_num = rand(Float16, 1)[1]
                if random_num <= probability
                    push!(selected_parents, entity)
                end
            end
        end

        return selected_parents

    end

end
