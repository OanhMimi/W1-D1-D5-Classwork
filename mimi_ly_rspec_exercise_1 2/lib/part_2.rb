def hipsterfy(word)
    vowels = "aeiou"
    i = word.length-1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
        i-=1
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    hash = Hash.new(0)
    str.each_char do |char|
        if vowels.include?(char.downcase)
            hash[char.downcase]+=1
        end
    end
    hash
end

def caesar_cipher(message,n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_string = ""
    message.each_char do |char|
        if alphabet.include?(char)
            current_idx = alphabet.index(char)
            new_idx = current_idx + n
            new_string += alphabet[new_idx % alphabet.length]
        else
            new_string += char
        end
    end
    new_string
end