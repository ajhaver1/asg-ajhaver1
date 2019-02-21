# ask user to enter study title
println("Please enter title of study from clinicaltrials.gov")
phrase = readline(stdin)

println("you said \"$phrase\"") 
phrase_length = length(phrase)

if phrase_length > 75 
	lastfivechar = phrase[phrase_length-5:phrase_length]
	println("your last five characters are \"$lastfivechar\"")

elseif phrase_length < 75 
	five_char = phrase[1:5]
	println("your first five characters are \"$five_char\"")
end

if occursin(r"[0-9]", phrase)
	println("your title includes some numbers...")

end

println("Please enter another title")
phrase = readline(stdin)

if phrase != "qqq"
	println("hmmm....not quite") 
	print("enter another phrase")
	user_input = readline(stdin)
end

if user_input != "qqq"
	println("you said \"$user_input\"") 
	phrase_length1 = length(user_input)
end

if phrase_length1 > 75 
	lastfivechar = phrase[phrase_length-5:phrase_length]
	println("your last five characters are \"$lastfivechar\"")

elseif phrase_length1 < 75 
	five_char = phrase[1:5]
	println("your first five characters are \"$five_char\"")
end

if occursin(r"[0-9]", user_input)
	println("your title includes some numbers...")
end