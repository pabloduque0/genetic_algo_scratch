
function binary_mutation!(entity)

    probability = 1 / length(entity.phenotype)
    println(probability)
    mutated_phenotype = ""
    for (index, bit) in enumerate(entity.phenotype)
        selector = rand(Float16, 1)[1]
        if selector < probability
            if bit == '0'
                mutated_phenotype *= '1'
            else
                mutated_phenotype *= '0'
            end
        else
            mutated_phenotype *= bit
        end
    end
    entity.phenotype = mutated_phenotype
end

mutable struct Entity
    real_range
    n_genes
    phenotype
    genotype
    fitness
end

entity = Entity(nothing, nothing, "1000101110101011100", nothing, nothing)
binary_mutation!(entity)

println("Before: ", "1000101110101011100", "\n After: ", entity.phenotype)
