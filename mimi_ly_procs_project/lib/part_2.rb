def reverser(str, &prc)
    new_string = prc.call(str.reverse)
    new_string
end

def word_changer(sent,&prc)
    new_arr = sent.split(" ").map {|word| prc.call(word)}
    new_arr.join(" ")
end

def greater_proc_value(number, prc1, prc2)
    if prc1.call(number) > prc2.call(number)
        prc1.call(number)
    else
        prc2.call(number)
    end
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each {|ele| new_arr << ele if prc1.call(ele) && prc2.call(ele)}
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr =[]
    arr.each_with_index do |ele,i|
        if i.even? 
            new_arr << prc1.call(ele)
        else
            new_arr << prc2.call(ele)
        end
    end
    return new_arr
end