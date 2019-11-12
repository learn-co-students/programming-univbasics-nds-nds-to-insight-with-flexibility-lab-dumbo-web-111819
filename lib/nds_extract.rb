# Provided, don't edit
require 'directors_database'
require 'pp'
require 'pry'
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
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  index = 0 
     dir_with_movie_data = []
     while index < movies_collection.count do 
     result = movie_with_director_name(name,movies_collection[index])
 dir_with_movie_data.push(result)
     index+=1 
end 
dir_with_movie_data
end
#  returns an array with a hash which contains name and list of films

def gross_per_studio(collection)
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
list_of_studios = []
total = 0
index = 0 
hash_of_total = {}
 while index < collection.count do 

    if list_of_studios.include?(collection[index][:studio])

   total += collection[index][:worldwide_gross]
 else
  list_of_studios.push(collection[index][:studio])
  total = 0 
   total += collection[index][:worldwide_gross]
    end
  hash_of_total[collection[index][:studio]] = total
  index+=1

 end
return hash_of_total
end
#  first push all the studios onto an array, use .unique to eliminate duplicates, then set key/value to 0 then loop through the studios adding th
# final hash would be hash[index of array of studios] = add total gross per studio 

# if studio == studio add worldwide_gross
# add a studios_totals into a hash with the studio as the key
# result = {studio => sum, studio => sum}


def movies_with_directors_set(source)
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
 director_list = []
 dir_index = 0 
 results = []
 hash_of_names = []
 director_names = {}
  while dir_index < source.count do 
       movies_array = []
    movie_index = 0 
    while movie_index < source[dir_index][:movies].count do 
 
      movies_array.push(source[dir_index][:movies][movie_index][:title])
      movie_index+=1 
        end
     director_list.push(source[dir_index][:name])
     director_names[director_list[dir_index]] = movies_array
  # create the hash in the loop adding the value to a new key
    dir_index+=1 
  end 
 director_names
end
end
# movie = source[index][:movies][index][:title]
# director = source[index][:name]
#   [[{director1: 'movie'}
#   {director1: 'movie'}]
#   [{director2: 'movie'}
#   {director2: 'movie'}]

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end