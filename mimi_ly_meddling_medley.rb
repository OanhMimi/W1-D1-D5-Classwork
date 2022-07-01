def duos(str)
    count = 0
    str.split("").each_with_index {|letter,i| count+=1 if str[i] == str[i+1]}
    count
end


p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0


def sentence_swap(sent,hash)
    new_arr = []
    sent.split(" ").each do |ele|
        if hash.has_key?(ele)
            new_arr << hash[ele] 
        else
            new_arr << ele
        end
    end
    new_arr.join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

def hash_mapped(hash,prc,&block)
    new_hash = {}
    hash.each do |k,v|
        new_hash[block.call(k)] = prc.call(v)
    end
    new_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}
p "--------------"

def counted_characters(sent)
    new_arr = []
    hash = Hash.new(0)
    sent.each_char do |ele|
        hash[ele] += 1
    end
    hash.each do |k,v|
        if v > 2
            new_arr << k
        end
    end
    new_arr
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
p "------------------"

def triplet_true(str)
    if str.length < 3
        return false
    end
    i = 0
    while i < str.length
        if str[i] == str[i+1] && str[i+1] == str[i+2]
            return true
        end
        i+=1
    end
    return false
end 
p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

p "------------------"

def energetic_encoding(str,hash)
    new_string = ""
    str.each_char do |char|
        if hash.has_key?(char)
            new_string += hash[char]
        elsif char == " "
            new_string += " "
        else
            new_string += "?"
        end
    end
    new_string
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
p "------------------"


def uncompress(str)
    new_string = ""
    # i = 0
    # while i < str.length
    #     n = str[i+1]
    #     n = n.to_i
    #     n.times do 
    #         new_string += str[i]
    #     end
    #     i+=1
    # end
    # new_string
    str.each_char.with_index do |char,i|
        n = str[i+1]
        n = n.to_i
        new_string += char*n
    end
    new_string

end
p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

p"------------------"

def conjunct_select(arr,*prc)
    # arr.select { |ele| prc.all? {|prc| prc.call(ele)} }
    new_arr = []
    arr.each do |ele|
        if prc.all? { |prc| prc.call(ele)}
        new_arr << ele
        end
    end
    new_arr
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

p "--------------"

def convert_pig_latin(sent)
    new_arr = []
    sent.split(" ").each do |word|
        if word.length < 3
            new_arr << word
        else
            new_word = newWord(word)
            new_arr << new_word
        end
    end
    new_arr.join(" ")
end

def newWord(w)
    vowels = "aeiou"
    if vowels.include?(w[0].downcase)
        return w + "yay"
    end

    w.each_char.with_index do |char,i|
        if vowels.include?(char.downcase) && w[0] == w[0].upcase
            return w[i].upcase + w[i+1..-1].downcase + w[0...i].downcase + "ay"
        elsif vowels.include?(char.downcase)
            return w[i..-1] + w[0...i] + "ay"
        end
    end
end

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"




p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"