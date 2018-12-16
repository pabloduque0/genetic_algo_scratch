# genetic_algo_julia

Simple genetic algorithm to optimize real functions of multiple variables from scratch in Julia.

Algorithim parameters are given in algo_inputs.txt:

- num_generations
- population_size
- number_genes
- variable_range_low
- variable_range_high
- function_param: Functions available are sphere and schwefel.



#### Results examples:

Graphs on the left show fitness average on population and on the right fitness maximum.

###### Schwefel function

![](/harddrive/home/pablo/Google Drive/UNED/Computacion_Evolutiva/Actividades/Actividad_1/genetic_algo_scratch/resources/fitness_mean_schwefel.png)

###### Sphere function

![fitness_mean_schwefel_gray](/harddrive/home/pablo/Google Drive/UNED/Computacion_Evolutiva/Actividades/Actividad_1/genetic_algo_scratch/resources/fitness_mean_sphere.png)

##### Demo

You can simply run genetic_algo.jl

Make sure you make any changes you would like according to plotting your results.