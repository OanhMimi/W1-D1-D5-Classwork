def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr_of_hashes)
    arr_of_hashes.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays(twod_arr) 
    twod_arr.count {|subArray| subArray.sum > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char.with_index do |char,i|
        if vowels.include?(char.downcase)
            new_word += char.downcase + "b" + char.downcase
        else
            new_word += char
        end
    end
    new_word
end

def aba_array(words_arr)
    words_arr.map do |word|
        aba_translate(word)
    end
end
