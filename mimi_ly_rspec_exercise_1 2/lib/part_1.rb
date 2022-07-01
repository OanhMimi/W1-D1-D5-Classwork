def average(num_1, num_2)
    average = (num_1+num_2)/2.0
end

def average_array(arr)
    sum = arr.inject {|acc, ele| acc + ele}
    sum/(arr.length*1.0)
end

def repeat(str, number)
    str*number
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sent)
    sent_arr = sent.split(" ")
    new_arr = sent_arr.map.with_index { |word,i| i.even? ? word.upcase : word.downcase}
    new_arr.join(" ")
end