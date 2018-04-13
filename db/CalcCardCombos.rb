all = ["+", "-", "/", "*", "(", ")", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
syms = ["+", "-", "/", "*"]
spsyms = ["(", ")", " "]
allsyms = ["+", "-", "/", "*", "(", ")"]

# tester1 = [nums, syms, nums, syms, nums, syms, nums, syms] (where syms were all symbols inluding ())
# tester2 = [spsyms, nums, spsyms, syms, spsyms, nums, spsyms, syms, spsyms, nums, spsyms, syms, spsyms, nums, spsyms, syms, spsyms]

tester3pt1 = [["("], nums, syms, nums, [")"], syms, nums, syms, nums]
tester3pt2 = [["("], nums, syms, nums, [")"], syms, ["("], nums, syms, nums, [")"]]
tester3pt3 = [["("], nums, syms, nums, syms, nums, [")"], syms, nums]
tester3pt4 = [nums, syms, nums, syms, nums, syms, nums]

#THE METHOD -- ALL PERMUTATIONS
def permutations(arrays, i)
  if i == arrays.length then return [[]] end

  res_next = permutations(arrays, i + 1)
  res = []
  arrays[i].each do |x|
    res_next.each do |y|
       res << ([x] + y)
    end
  end
    return res
end

#THE RESULTS -- ALL PERMUTATIONS

def find_candidates(array_of_arrays_of_arrays)
  allsyms = ["+", "-", "/", "*", "(", ")"]
  somefile = File.new("cards.txt", "w")
  array_of_arrays_of_arrays.each do |a_of_a|
    all_results = permutations(a_of_a, 0)
    cards = []

    all_results.each do |r|
      begin
        eval(r.join(""))
      rescue Exception => exc
      else
        if eval(r.join("")) == 24 then cards << r end
      end
    end

    cards.each do |array|
      numsOnly = array.select do |char|
        !allsyms.include?(char)
      end
      candidate = numsOnly.map do |num|
        num.to_i
      end
      somefile.print candidate
      somefile.print ","
    end

  end
  somefile.close
end

find_candidates([tester3pt1, tester3pt2, tester3pt3, tester3pt4])
