## create program for assignment 11

# open input file 
input_file = open("class_code/brfss2017_ri.txt", "r")

# create dictionary for counts 
weight_count_dict = Dict()

#dictionary for weight values 
weight_count_dict = Dict()
weight_count_dict["weight(pounds)"] = 0
weight_count_dict["don't know/not sure"] = 0
weight_count_dict["weight(kilograms)"] = 0 
weight_count_dict["not asked or missing"] = 0 
weight_count_dict["refused"] = 0 

# read in each line in input file 
for line in readlines(input_file)

# get weight value
	weight_value = string(line[183:186])

	if weight_value == "7777"
		weight_count_dict["don't know/not sure"] += 1 
	elseif weight_value == " "
		weight_count_dict["not asked or missing"] += 1 
	else weight_value == "9999"
		weight_count_dict["refused"]
	end

	if occursin(r"^9", weight_value)
		weight_count_dict["weight(kilograms)"] += 1 
	elseif occursin(r"^0", weight_value)
		weight_count_dict["weight(pounds)"] += 1 
	else 
		weight_count_dict["not asked or missing"] += 1 
	end 

end

# close file
close(input_file)

# print frequency of each value for weight 

println("Distribution of Weight Value")

output_file = open("ajhaver1_asg11_output.txt", "w")
for (count, weight_value_key) in sort(collect(zip(values(weight_count_dict),keys(weight_count_dict))), rev=false)
		println("$(weight_value_key) = $(weight_count_dict[weight_value_key])")
		write(output_file, "$(weight_value_key) = $(weight_count_dict[weight_value_key])\n")
	end
	

