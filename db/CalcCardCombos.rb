all = ["+", "-", "%", "*", "(", ")", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
syms = ["+", "-", "/", "*", "(", ")", " "]

tester = [nums, syms, nums, syms, nums, syms, nums, syms]


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

all_results = permutations(tester, 0)


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
  candidate = numsOnly.map do |num|
    num.to_i
  end
  somefile.print candidate
  somefile.print ","
end

# cards.each do |array|
#   somefile.print array
# end


somefile.close
