# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".


def compress_str(str)


    i = 0
    new_string = ""
    while i < str.length      #("aaabbc")  
        char = str[i]
        count = 0
        while char == str[i]      #"a" = "a"
            count+=1              #count = 3
            i+=1                 #i = 3
        end
        if count <= 1
            new_string += char
        else
            new_string += count.to_s + char
        end
    end
    new_string

end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
