require "byebug"
def zip(*arr)
    new_arr = [] 
    (0...arr[0].length).each do |i| #3
        temp_arr = []
        arr.each do |subArray| #[["a","b","c"],[1,2,3]]
            temp_arr << subArray[i]  
        end
        new_arr << temp_arr
    end
    new_arr 
end

def prizz_proc(arr, prc_1, prc_2) 
    return arr.select do |ele| 
        ele if prc_1.call(ele) && !prc_2.call(ele) || prc_2.call(ele) && !prc_1.call(ele)
    end
end

def zany_zip(*arr)
    length = arr[0].length
    arr.each do |subArray|
        if subArray.length > length
            length = subArray.length
        end
    end

    new_arr = []
    (0...length).each do |i|
        temp_arr = []
        arr.each do |subArray|
            temp_arr << subArray[i]
        end
        new_arr << temp_arr
    end
    new_arr
end

def maximum(arr,&prc)
    max = 0
    temp_greatest = arr[0]
    arr.each do |ele|
        if prc.call(ele) > max
            max = prc.call(ele)
            temp_greatest = ele
        elsif
            prc.call(ele) == max
            temp_greatest = ele
        end
    end
    temp_greatest
end

def my_group_by(arr,&prc)
    hash = Hash.new {|h,k| h[k] = []} 
    arr.each do |ele|
        result = prc.call(ele)  
        hash[result] << ele
    end
    hash
end

def max_tie_breaker(arr, prc, &block)
    temp_num = 0
    max_ele = arr[0]

    arr.each do |ele|
        if block.call(ele) > temp_num 
            temp_num = block.call(ele)  #['cat', 'bootcamp', 'swimming', 'ooooo'] block = length
            max_ele = ele
        elsif block.call(ele) == temp_num
            if prc.call(ele) > prc.call(max_ele)
                max_ele = ele
            elsif prc.call(ele) < prc.call(max_ele)
                max_ele
            else
                return ele if arr.index(ele) < arr.index(max_ele)
            end
        end      
    end
    return max_ele
end

require "byebug"
def silly_syllables(sent)
    vowels = "aeiou"
    new_arr = []
    sent.split(" ").each do |word|
        if countWord(word)
            new_arr << newWord(word)
        else
            new_arr << word
        end
    end
    new_arr.join(" ")
end

def countWord(w)
    vowels = "aeiou"
    count = 0
    w.each_char {|char| count+=1 if vowels.include?(char)}
    return true if count > 1
    false
end

def newWord(w)
    vowels = "aeiou"
    string = ""
    w.each_char.with_index do |char,i|
        if vowels.include?(char)
            string = w[i..-1]
            i = string.length - 1
            while i >= 0
                if vowels.include?(string[i])
                    return string[0..i]
                end
                i-=1
            end
        end
    end
    
end