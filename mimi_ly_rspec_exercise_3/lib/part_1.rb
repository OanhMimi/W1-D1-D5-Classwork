def is_prime?(n)
    return false if n < 2 
    (2...n).each do |divisible|
        if n % divisible == 0
            return false
        end
    end
    true
end

def nth_prime(n)
    new_arr = []
    i = 2  #n = 4 [2,3,5,7]   
    while new_arr[n-1].nil? #..new_arr[3] = new_arr=[2.3,5,7]
        if is_prime?(i)
            new_arr << i
        end
        i+=1
    end
    new_arr[n-1]
end

def prime_range(min,max)
    (min..max).select {|num| is_prime?(num)}
end