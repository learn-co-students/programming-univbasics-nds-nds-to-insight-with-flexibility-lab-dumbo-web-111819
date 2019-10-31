# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  #here we are looping over movies_collection which is an array of Hashes 
  #where each hash  represents the info of the movie,
  # via a loop, we need to take out those hashes from the array and pass into the 
  # movie_with_director_name method along with director_name so that , it will return 
  #an array of hash which will include the name of the director and the movie info 
  i =  0
  movie_array = [] 
  while i < movies_collection.length do
    obj_movie = movies_collection[i]
    movie_array << movie_with_director_name(name, obj_movie)
    i+= 1
  end 
 
  return movie_array
end


def gross_per_studio(collection)
  
  hash = {}
  i = 0
  while i < collection.length do
    each_obj = collection[i]
    income = each_obj[:worldwide_gross]
    studio_name = each_obj[:studio]
    
    if hash[studio_name] == nil 
      hash[studio_name] = income
    else 
      hash[studio_name] += income
    end
    
    i+= 1
  end
  return hash
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end

def movies_with_directors_set(source)
  obj = {}
  result = []
  i = 0 
  
  while i < source.length do 
    each_element_obj = source[i]
    name_of_dir = each_element_obj[:name]
    each_movie_array = each_element_obj[:movies]
    single_director_movies = movies_with_director_key(name_of_dir, each_movie_array)
    result.push(movies_with_director_key(name_of_dir, each_movie_array))
    p source
    i += 1
  end 

return result
  
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
