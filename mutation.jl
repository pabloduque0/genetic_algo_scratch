module Mutation

    function perform_all_mutations!(population, mutation_func)
        for entity in population
            mutated_genotypes = []
            for genotype in entity.genotype
                push!(mutated_genotypes, binary_mutation(genotype))
            end
            entity.genotype = mutated_genotypes
        end
    end

    function binary_mutation(orig_genotype)

        probability = 1 / length(orig_genotype)
        println(probability)
        mutated_genotype = ""
        for (index, bit) in enumerate(orig_genotype)
            selector = rand(Float16, 1)[1]
            if selector < probability
                if bit == '0'
                    mutated_genotype *= '1'
                else
                    mutated_genotype *= '0'
                end
            else
                mutated_genotype *= bit
            end
        end
        orig_genotype = mutated_genotype
    end

    """
    function test_binary_mutation()
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

    end
    """

end
