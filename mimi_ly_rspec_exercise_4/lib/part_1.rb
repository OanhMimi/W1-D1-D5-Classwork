def my_reject(arr,&prc)
    arr.select{|ele| !prc.call(ele)}
end

def my_one?(arr,&prc)
    count = 0
    arr.each {|ele| count+=1 if prc.call(ele)}
    return true if count == 1
    false
end

def hash_select(hash,&prc)
    new_hash = {}
    hash.each do |k,v|
        if prc.call(k,v)
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(arr,prc_1,prc_2)
    arr.select {|ele| prc_1.call(ele)&&!prc_2.call(ele) || !prc_1.call(ele)&&prc_2.call(ele)}
end

def proc_count(num, arr)
    arr.count{|prc| prc.call(num)}
end
