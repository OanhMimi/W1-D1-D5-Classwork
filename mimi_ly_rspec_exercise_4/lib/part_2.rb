def proper_factors(n) 
    (1...n).select {|ele| n % ele == 0}
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(n)
    return true if n == aliquot_sum(n)
    false
end

def ideal_numbers(n)
    new_arr = []
    i = 1
    while new_arr[n-1].nil?
        if perfect_number?(i)
            new_arr << i
        end
        i+=1
    end
    new_arr  
end