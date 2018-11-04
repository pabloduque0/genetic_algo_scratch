
function two_point_xover(parent1, parent2)

    if length(parent1) != length(parent2)
        throw(ArgumentError("Both parents binary strings must have the same
        length"))
    point1 = rand(1:length(parent1)-1)
    point2 = point1
    while point2 == point1
        point2 = rand(1:length(parent1)-1)
    end

    first_segment = parent1[1:point1]
    second_segment = parent2[point1:point2]

end


parent1 = "1111111111111"
parent2 = "0000000000000"

two_point_xover(parent1, parent2)
