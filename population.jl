module Population

    using Random

    mutable struct Entity
        real_range
        n_genes
        phenotype
        genotype
        fitness
        age
    end


    function generate_population(_length, number_genes, range=(0, 100))
        population = []
        for elem = 1:_length-1
            if range[1] > 0
                real_range_1 = rand(Float16, 1)[1] * 100
                real_range_2 = rand(Float16, 1)[1] * 100
            else
                real_range_1 = (rand(Float16, 1)[1] * (range[1]*2)) - range[1]
                real_range_2 = (rand(Float16, 1)[1] * (range[2]*2)) - range[2]
            end

            if real_range_1 >= real_range_2
                full_range = (real_range_2, real_range_1)
                phenotypes, genotypes = generate_variables(real_range_2, real_range_1, number_genes)
            else
                full_range = (real_range_1, real_range_2)
                phenotypes, genotypes = generate_variables(real_range_1, real_range_2, number_genes)
            end

            entity = Entity(full_range,
                            number_genes,
                            phenotypes,
                            genotypes,
                            nothing,
                            1)
            push!(population, entity)
        end
        return population
    end

    function generate_variables(real_range_start, real_range_stop, steps)

        phenotypes = []
        genotypes = []
        for element = 0:steps
            binary_string = get_string_genotype(steps)
            int_number = parse(Int, binary_string, base = 2)
            step_size = real_range_stop - real_range_start

            phenotype = real_range_start + (step_size*int_number)
            push!(genotypes, binary_string)
            push!(phenotypes, phenotype)
        end
        return phenotypes, genotypes
    end

    function get_string_genotype(length)
        bitlength = ceil(Int, log(2, length))
        bit_array_string = bitrand(bitlength)
        binary_array = convert(Array{Int, 1}, bit_array_string)
        binary_string = join(binary_array, "")
        return binary_string
    end

    function test_generate_population()
        population_size = 10
        number_genes = 8
        variable_range = (-10, 10)

        population = generate_population(population_size, number_genes, variable_range)
        print(population)

    end

end
