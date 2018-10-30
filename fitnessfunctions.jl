
function evaluate_all_fitness!(entities, fitness_func, eval_on="phenotype")

    if eval_on == "phenotype"
        for entity in entities
            entity.fitness = fitness_func(entity.phenotype)
        end

    elseif eval_on == "genotype"
        for entity in entities
            entity.fitness = fitness_func(entity.genotype)
        end
    end

end


function sphere(variables)
    _sum = 0
    for element in variables
        _sum += element^2
    end
    return _sum
end

function schwefel(variables)
    len_vars = length(variables)
    _sum = 0
    for (index, element) in enumerate(variables)
        _sum += element * sin(abs(element)^(1/2))
    end
    schwefel_const = 418.9829
    fitness = schwefel_const * len_vars - _sum
end
