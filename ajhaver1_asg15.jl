## Methods 2019 Assignment 15


# Open input file
input_file = open("brfss2017_ri.txt", "r")

# Calculate BMI from BRFSS Codebook

## Create a dictionary for BMI Counts

bmi_count_dict = Dict()
bmi_count_dict["underweight"]  = 0
bmi_count_dict["normal"] = 0
bmi_count_dict["overweight"] = 0
bmi_count_dict["obese"] = 0
bmi_count_dict["extreme or high risk obesity"] = 0

## Read Each Line in Codebook

for line in readlines(input_file)
	height = string(line[187:190])
	weight = string(line[183:186])

  	if height != "7777" && height != "9999" && height != "    " && occursin(r"^0", height) 
         # This statement excludes all height values that are blank/missing/refused and ensures units are imperial
              println("These are height values with blank/missing/refused removed")
			  FT = parse(Float64,height[1:2])
			  IN = parse(Float64,height[3:4])
			  height = FT * 12 + IN
              println("New height is: $height")

    elseif height != "7777" && height != "9999" && height != "    "  && occursin(r"^9", height) 
         ## This statement excludes height values that are blank/missing/refused and isolates those that are in metric
             println("These are height values in metric")
             height = (parse(Float64, height)/100) * .393
             println("New height is: $height")

    end 
	
	if weight != "7777" && weight != "9999" && weight != "    " && occursin(r"^0", weight) 
         ## This statement excludes weight values with blank/missing/refused and ensures units are imperial
             println("These are weight values with blank/missing/refused removed")
             weight = parse(Float64, weight)
             println("New weight is: $weight")

     elseif weight != "7777" && weight != "9999" && weight != "    " && occursin(r"^9", weight) 
         ## This statement excludes weight values that are blank/missing/refused and isolates those that are in metric
             println("These are weight values in metric")
             weight = parse(Float64, weight) * 2.204
             println("New weight is: $weight")
     end

     if typeof(weight) == Float64 && typeof(height) == Float64 
     	bmi = (weight / (height ^ 2)) * 703 
     	println("\nBMI = $bmi")

		if bmi < 18.5
   			bmi_count_dict["underweight"] += 1
		elseif bmi < 25.0
  			bmi_count_dict["normal"] += 1
		elseif bmi < 30.0
  			bmi_count_dict["overweight"] += 1
		elseif bmi < 40.0
   			bmi_count_dict["obese"] += 1
		else
  			bmi_count_dict["extreme or high risk obesity"] += 1
	end

## Open ouput file 

output_file = open("methods2019_asg15_output.txt", "w")

## count all values 

for (count_value, bmi_key) in sort(collect(zip(values(bmi_count_dict),keys(bmi_count_dict))), rev=false)
write(output_file, "$(bmi_key) = $(bmi_count_dict[bmi_key])\n")
end

### Close output file 

close(output_file)
	end
end 
