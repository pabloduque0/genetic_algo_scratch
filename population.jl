module Population

    include("./utils.jl")
    using .Utils
    using Random

    mutable struct Entity
        real_range
        n_genes
        phenotype
        genotype
        fitness::Float64
        age
    end

    Base.copy(a::Entity) = Entity(a.real_range, a.n_genes,
                                        a.phenotype, a.genotype,
                                        a.fitness, a.age)

    #Base.copy(x::T) where T = T([getfield(x, k) for k ∈ fieldnames(T)]...)
    function generate_population(_length, number_genes, _range=(0, 100), gray_code_flag=false)
        population = []
        for elem = 1:_length-1
            if _range[1] > 0
                real_range_1 = rand(Float16, 1)[1] * _range[2]
                real_range_2 = rand(Float16, 1)[1] * _range[2]
            else
                real_range_1 = (rand(Float16, 1)[1] * (_range[1]*2)) - _range[1]
                real_range_2 = (rand(Float16, 1)[1] * (_range[2]*2)) - _range[2]
            end

            if real_range_1 >= real_range_2
                full_range = (real_range_2, real_range_1)
                phenotypes, genotypes = generate_variables(real_range_2, real_range_1,
                                                            number_genes, gray_code_flag)
            else
                full_range = (real_range_1, real_range_2)
                phenotypes, genotypes = generate_variables(real_range_1, real_range_2,
                                                            number_genes, gray_code_flag)
            end

            entity = Entity(full_range,
                            number_genes,
                            phenotypes,
                            genotypes,
                            NaN64,
                            1)
            push!(population, entity)
        end
        return population
    end

    function generate_variables(real_range_start, real_range_stop, steps, gray_code_flag)

        phenotypes = []
        genotypes = []
        for element = 0:steps
            binary_string = get_string_genotype(steps)
            int_number = parse(Int, binary_string, base = 2)

            if gray_code_flag == true
                binary_string = Utils.generate_graycode(int_number, binary_string)
            end
            step_size = (real_range_stop - real_range_start) / steps
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
