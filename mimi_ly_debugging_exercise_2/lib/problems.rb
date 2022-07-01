# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(num)
    (1..num).reverse_each do |ele|
        return ele if num % ele == 0 && isPrime?(ele)
    end
end

def isPrime?(n)
    return false if n < 2
    (2...n).each do |divisible|
        if n % divisible == 0
            return false
        end
    end
    return true
end

def unique_chars?(string)
    hash = Hash.new(0)
    string.each_char do |char|
        hash[char]+=1 
    end
    hash.each_value {|v| return false if v >= 2}
    true
end

def dupe_indices(array)

    hash = {}
    array.each_with_index do |ele1,idx1|
        array.each_with_index do |ele2,idx2|
            if idx2 > idx1 && ele1 == ele2
                hash[ele1] = [idx1,idx2]
            end
        end
    end
    hash
end


def  ana_array(arr_1, arr_2) 
    hash1 = findHash(arr_1)
    hash2 = findHash(arr_2)
    if hash1 == hash2
        true
    else
        false
    end
end

def findHash(arr)
    hash = {}
    arr.each do |ele|
        hash[ele] = true
    end
    hash
end



