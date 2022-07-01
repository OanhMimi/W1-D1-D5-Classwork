def palindrome?(string)
    i = string.length - 1
    new_string = ""
    while i >= 0
        new_string += string[i]
        i-=1
    end
    return true if new_string == string
    false
end

def substrings(string)
    new_arr = []
    (0...string.length).each do |num| #0..string.length
        (num...string.length).each do |num2| #num..string.length
            new_arr << string[num..num2] #new_arr << string[0..0] 
        end
    end
    new_arr
end

def palindrome_substrings(str)
    array = substrings(str)
    new_arr = []
    array.each {|ele| new_arr << ele if ele.length > 1 && palindrome?(ele)}
    new_arr
end

