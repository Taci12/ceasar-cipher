require 'pry-byebug'

def int_indexed_hash(range)
    hash = {}
    i = 0
    range.each do |char| 
        hash[i] = char
        i += 1
    end
    return hash
end

def char_indexed_hash(range)
    hash = {}
    i = 0
    range.each do |char| 
        hash[char] = i
        i += 1
    end
    return hash
end

def ceasar_cypher(string, key)

    low_int_hash = int_indexed_hash('a'..'z') #{1 => 'a', 2 => 'b', etc}
    #p "low int hash: #{low_int_hash}"
    upper_int_hash = int_indexed_hash('A'..'Z') #{1 => 'A', 2 => 'B', etc}
    #p "upper int hash: #{upper_int_hash}"
    low_char_hash = char_indexed_hash('a'..'z') # {'a' => 1, 'b' => 2}
    #p "low char hash: #{low_char_hash}"
    upper_char_hash = char_indexed_hash('A'..'Z') # {'A' => 1, 'B' => 2}
    #p "upper char hash: #{upper_char_hash}"


    old_array = string.split("") #to add cyphered chars, then make it a string
    new_array = []
    char_code = 0
    old_array.each_with_index do |char, i|
        if (char == ' ') 
            new_array[i] = ' '
        elsif !(char == char.capitalize)  #if char is downcase
            char_code = low_char_hash[char] + key #cyphered char code        
            if char_code > 25 
                new_array[i] = low_int_hash[char_code - 26]
            else
                new_array[i] = low_int_hash[char_code]
            end
            p "char_code: #{char_code}, array: #{new_array}"
        else #if char is upcase
            char_code = upper_char_hash[char] + key #same steps as downcase
            if(char_code > 25)
                new_array[i] = upper_int_hash[char_code - 26]
            else
                new_array[i] = upper_int_hash[char_code]
            end 
            p "char_code: #{char_code}, array: #{new_array}"
        end
    end
    new_array.join("")
end

cyphered_hello = ceasar_cypher('ZzZAaA', 1) 
p "#{cyphered_hello}"