all = ["+", "-", "%", "*", "(", ")", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
syms = ["+", "-", "/", "*"]
spsyms = [" ", "(", ")"]

# tester1 = [nums, syms, nums, syms, nums, syms, nums, syms] (where syms were all symbols inluding ())
# tester2 = [spsyms, nums, spsyms, syms, spsyms, nums, spsyms, syms, spsyms, nums, spsyms, syms, spsyms, nums, spsyms, syms, spsyms]

tester3pt1 = [spsyms, nums, syms, nums, spsyms, nums, syms, nums]
tester3pt2 = [spsyms, nums, syms, nums, syms, nums, spsyms, nums]
tester3pt3 = [spsyms, nums, syms, nums, spsyms, spsyms, nums, syms, nums, spsyms]

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

all_results = permutations(tester3pt1, 0)

cards = []

all_results.each do |r|
  begin
    eval(r.join(""))
  rescue Exception => exc
  else
    if eval(r.join("")) == 24 then cards << r end
  end
end

somefile = File.open("cards.rb", "w")

cards.each do |array|
  numsOnly = array.select do |char|
    !syms.include?(char)
  end
  #
  # if numsOnly.include?("6" && "4") && numsOnly.uniq.length == 2
  #   print array
  #   debugger
  # end
  #
  # if numsOnly.include?("8" && "3" && "4") && numsOnly.uniq.length == 3
  #   print array
  # end

  candidate = numsOnly.map do |num|
    num.to_i
  end
  #
  # if candidate == [6, 4, 4, 6] then debugger end
  # if candidate == [8, 8, 3, 4] then debugger end

  somefile.print candidate
  somefile.print ","
end


somefile.close
