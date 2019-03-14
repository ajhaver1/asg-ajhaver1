## assignment 13 ajhaver1

## call HTTP package 

using HTTP 

## https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term="brown university"[ad]

# define base URL
base_search_query = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi"

# define query term
query_term = "\"brown university\"[ad] and \"electronic health records\"[mh]"

println("hello. I will search for $query_term")

## define a dictionary to send to pubmed

query_dict  = Dict()
query_dict["db"] = "pubmed"
query_dict["term"] = query_term

search_result = String(HTTP.post(base_search_query,body=HTTP.escapeuri(query_dict)))

println(search_result)

pmid_set = Set()
# parse through result set
for result_line in split(search_result, "\n")

	pmid_capture = match(r"<Id>(\d+)<\/Id>", result_line)

	if pmid_capture != nothing
		push!(pmid_set, pmid_capture[1])
	end

end


id_string = join(collect(pmid_set), ",")

base_fetch_query = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi"

query_dict["db"] = "pubmed"
query_dict["id"] = id_string
query_dict["rettype"] = "medline"
query_dict["retmode"] = "text"

fetch_result = String(HTTP.post(base_fetch_query, body=HTTP.escapeuri(query_dict)))

# pull out MeSH descriptors from efetch results
mesh_dict = Dict()
for fetch_line in split(fetch_result, "\n")
    

 	pmid_capture = match(r"PMID- ([0-9]+)", fetch_line)
	
	if pmid_capture != nothing
          print("$(pmid_capture[1])|")

          if haskey(mesh_dict, pmid_capture[1])
          	mesh_dict[pmid_capture[1]] += 1 
          else
          	mesh_dict[pmid_capture[1]] = 1
    	  end
   	end 

   	dcom_capture = match(r"DCOM- ([0-9]+)", fetch_line)

    if dcom_capture != nothing
           print("$(dcom_capture[1])|")

        # store MeSH descriptors, keeping track of occurence 
        if haskey(mesh_dict, dcom_capture[1])
            mesh_dict[dcom_capture[1]] += 1
        else
            mesh_dict[dcom_capture[1]] = 1
        end

    end

    crdt_capture = match(r"CRDT- ([0-9]\S+)", fetch_line)

    if crdt_capture != nothing
    	print("$(crdt_capture[1])")

   		if haskey(mesh_dict, crdt_capture[1])
   			mesh_dict[crdt_capture[1]] += 1 
   		else 
   			mesh_dict[crdt_capture[1]] = 1 
   		end 
 	end 
end

for mesh_descriptor in keys(mesh_dict)
	if mesh_dict[mesh_descriptor] > 1
		println("$mesh_descriptor occurs $(mesh_dict[mesh_descriptor])")
	end
end


	
