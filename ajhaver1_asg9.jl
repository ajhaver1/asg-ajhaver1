# asks user to enter the title for a PubMed Article

println("Please enter the title for a PubMed article")
phrase = readline(stdin)

# create while loop to ensure phrase is not "qqq"
while phrase!= "qqq"

# Prints the number of words in the title 
word_array = []
word_array = split(phrase, " ")
print("number of words in the title (# words): $(length(word_array))\n")

# prints the number of unique words in the title
print("unique elements in my array: $(unique(word_array))\n")

#checks each word and indicates if it:
# starts with a number 
 
for word in word_array 
	if occursin(r"^[0-9]", phrase)
   	println("$word starts with a number")
	end

# starts with a letter 
	if occursin(r"^[a-z]", phrase)
	println("$word starts with a letter")
	end

# ends with a period 
	if occursin(r"[.$]", phrase)
	println("$word ends with a period")
	end
end

#translate all numbers words less than ten into digits 

# create dictionary of translations 
translated_word_dict= Dict()
translated_word_dict["one"]= "1"
translated_word_dict["two"]= "2"
translated_word_dict["three"]= "3"
translated_word_dict["four"]= "4"
translated_word_dict["five"]= "5"
translated_word_dict["six"]= "6"
translated_word_dict["seven"]= "7"
translated_word_dict["eight"]= "8" 
translated_word_dict["nine"]= "9"
translated_word_dict["ten"]= "10"

#translate word numbers into actual digits 
translated_phrase_array = []
for word in word_array 
	if haskey(translated_word_dict, word) 
		translated_word = translated_word_dict[word]
		push!(translated_phrase_array, translated_word)
	end
end 

println("translated number is: $(join(translated_phrase_array, " "))")
println("please enter another phrase")
global phrase = readline(stdin)

end 




