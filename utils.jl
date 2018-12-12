module Utils
    function get_algo_params()
        file_info = open("/home/cx02392/Documentos/Personal/UNED/Computacion_Evolutiva/Actividad1/genetic_algo_scratch/algo_inputs.txt") do file
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


"""
def gray_code(n):
    def gray_code_recurse (g,n):
        k=len(g)
        if n<=0:
            return

        else:
            for i in range (k-1,-1,-1):
                char='1'+g[i]
                g.append(char)
            for i in range (k-1,-1,-1):
                g[i]='0'+g[i]

            gray_code_recurse (g,n-1)

    g=['0','1']
    gray_code_recurse(g,n-1)
    return g

def main():
    n=int(raw_input())
    g = gray_code (n)

    if n>=1:
        for i in range (len(g)):
            print g[i],

"""

    function gray_code_recursive(binary_string, n)

        length_str = length(binary_string)

        if n <= 0
            return
        elseif
            for i in length_str:-1:1
                char = '1' * binary_string[i]
                binary_string.append(char)
            end
            for i in length_str:-1:1
                binary_string[i] = '0' + binary_string[i]
            end
            gray_code_recursive(binary_string,n-1)
        end
    end

    function generate_graycode(binary_string)



    end
end
