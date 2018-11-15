module Crossover
    include("./population.jl")
    using .Population

    function generate_offspring(parents, xover_func)

        all_offspring = []
        for i = 1:2:length(parents)-1
            parent1 = parents[i]
            parent2 = parents[i+1]
            (offspring1, offspring2) = xover_func(parent1, parent2)
            push!(all_offspring, offspring1)
            push!(all_offspring, offspring2)

        end
        return all_offspring
    end

    function two_point_xover(parent1, parent2)

        if length(parent1.genotype) != length(parent2.genotype)
            throw(ArgumentError("Both parents binary strings must have the same
            length"))
        end
        point1 = rand(1:length(parent1.genotype[1])-1)
        point2 = point1
        while point2 == point1
            point2 = rand(1:length(parent1.genotype[1])-1)
        end
        if point1 > point2
            aux = point1
            point1 = point2
            point2 = aux
        end

        offspring1 = copy(parent1)
        offspring2 = copy(parent2)
        offspring1.genotype = ensemble_two_segments(point1, point2, parent1, parent2)
        offspring2.genotype = ensemble_two_segments(point1, point2, parent2, parent1)

        return (offspring1, offspring2)
    end

    function ensemble_two_segments(point1, point2, parent1, parent2)

        all_genotypes = []
        for (gene1, gene2) in zip(parent1.genotype, parent2.genotype)
            first_segment = gene1[1:point1]
            second_segment = gene2[point1:point2]
            third_segment = gene1[point2:end]
            offspring_genotype = first_segment * second_segment * third_segment
            push!(all_genotypes, offspring_genotype)
        end
        return all_genotypes
    end

end  # module Crossover

"""
function test_xover()
    parent1 = "1111111111111"
    parent2 = "0000000000000"

    offspring = two_point_xover(parent1, parent2)
    println(offspring)

end
"""
