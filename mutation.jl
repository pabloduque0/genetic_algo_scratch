module Mutation

    function perform_all_mutations!(population, mutation_func)
        differences = []
        for entity in population
            mutated_genotypes = []
            for genotype in entity.genotype
                push!(mutated_genotypes, binary_mutation(genotype))
            end
            difference = hamming_distance(mutated_genotypes, entity.genotype)
            push!(differences, difference)
            reset_phenotypes!(entity, mutated_genotypes)
            entity.genotype = mutated_genotypes
        end
        return differences
    end

    function binary_mutation(orig_genotype)

        probability = (1 / length(orig_genotype)) * 0.000001
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

    function hamming_distance(mutated, original)
        difference = 0
        for (gene1, gene2) in zip(mutated, original)
            for (ch1, ch2) in zip(gene1, gene2)
                difference += ch1 != ch2
            end
            difference += abs(length(gene1) - length(gene2))
        end
        return difference
    end

    function reset_phenotypes!(entity, mutated_genotypes)
        _range = entity.real_range
        step = (_range[2] - _range[1]) / entity.n_genes
        new_phenotypes = []
        for genotype in mutated_genotypes
            decimal = parse(Int, genotype, base = 2)
            new_phen = _range[1] + (decimal * step)
            push!(new_phenotypes, new_phen)
        end
        entity.phenotype = new_phenotypes

    end
end
