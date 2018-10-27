mutable struct Entity
    real_range
    n_genes
    phenotype
    genotype
end


function generate_population(length, number_genes)
    #population = Array{Entity}(length, 1)
    for elem in range(0, 98)
        real_value = rand(Float16, 1)[1]
        real_range_1 = rand(Float16, 1)[1] * 100
        real_range_2 = rand(Float16, 1)[1] * 100
        if real_range_1 >= real_range_2
            generate_variables(real_range_2, real_range_1, number_genes)
        else
            generate_variables(real_range_1, real_range_2, number_genes)
        end

        real_range = (real_range_start, real_range_stop)
        print(real_range)
        #phenotype = randn()
        #entity = Entity(real_range, number_genes)
        #push!(population, entity)
    end
end

function generate_variables(real_range_start, real_range_stop, steps)

    phenotypes = []
    genotypes = []
    for element in range(0, steps)


    end

end


population_size = 10
number_genes =

generate_population(population_size, number_genes)
