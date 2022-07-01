def all_words_capitalized?(words_arr)
    words_arr.all? {|word| word.capitalize == word}
end

def no_valid_url?(urls_arr)
    ending = [ ".com", ".net", ".io", ".org"]
    urls_arr.none? do |url|
        ending.any? {|en| url.end_with?(en)}
    end
end

def any_passing_students?(student_hashes)
    student_hashes.any? do|hash| 
        average = (hash[:grades].sum/hash[:grades].length) * 1.0
        average >= 75
    end
end