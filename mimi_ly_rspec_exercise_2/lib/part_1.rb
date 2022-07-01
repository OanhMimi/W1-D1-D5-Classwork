require "byebug"

def partition(array,number)
    array1 = []
    array2 = []
    array.each do |ele|
        if ele < number
            array1 << ele
        else
            array2 << ele
        end
    end
    new_arr = []
    new_arr << array1
    new_arr << array2 
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each do |k,v|
        new_hash[k] = v
    end

    hash_2.each do |k,v|
        new_hash[k] = v
    end
    new_hash
end

def censor(sent,array)
    new_arr = []
    sent.split(" ").each do |word|
        if array.include?(word.downcase) 
            new_arr << new_word(word)
        else
            new_arr << word
        end
    end
    new_arr.join(" ")
end

def new_word(w)
    vowel = "aeiou"
    new_string = ""
    w.each_char do |char|
        if vowel.include?(char.downcase)
            new_string += "*"
        else
            new_string += char
        end
    end
    new_string
end

def power_of_two?(number)
    (0...number).each do |n|
        return true if 2 ** n == number #2 to the power of n ==  number
    end
    false
end



