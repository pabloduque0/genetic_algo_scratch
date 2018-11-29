module Utils
    function get_algo_params()
        file_info = open("/harddrive/home/pablo/Google Drive/UNED/Computacion_Evolutiva/Actividades/Actividad_1/genetic_algo_scratch/algo_inputs.txt") do file
            read(file, String)
        end
        file_info = split(file_info, "\n")
        num_generations,  population_size, number_genes, variable_range = nothing, nothing, nothing, nothing
        variable_range_low, variable_range_high = nothing, nothing

        # Could be more efficient
        for param in file_info
            param = split(param, "=")
            if param[1] == "num_generations"
                num_generations = parse(Int, param[2])
            elseif param[1] == "population_size"
                population_size = parse(Int, param[2])
            elseif param[1] == "number_genes"
                number_genes = parse(Int, param[2])
            elseif param[1] == "variable_range_high"
                variable_range_high = parse(Int, param[2])
            elseif param[1] == "variable_range_low"
                variable_range_low = parse(Int, param[2])
            end
        end
        variable_range = (variable_range_low, variable_range_high)
        if num_generations == nothing || population_size == nothing ||
            number_genes == nothing || variable_range == nothing
            throw(ArgumentError("Missing parameters in algot_inputs.txt."))
        end

        return num_generations,  population_size, number_genes, variable_range
    end

    function gray_code_recursive()


    end

    function generate_graycode()

    end
end
