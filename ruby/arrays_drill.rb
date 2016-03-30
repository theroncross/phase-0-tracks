# Release 2
def build_array1 (first, second, third)
  [first, second, third]
end
p build_array1(3,"text",1)

def add_to_array(var1, var2)
  var1 << var2
end
p add_to_array([1,2,3], 4)
p add_to_array(["blue", "red",5], 8)
p add_to_array(build_array1("1st", "3rd", "2nd"), "4th")

# Release 1
teas = []
p teas

teas += ["Earl Grey", "Darjeeling", "Chamomile", "Rose hips", "Mint"]
p teas

teas.delete_at(2)
p teas

teas.insert(2, "peach")
p teas

teas.delete("Earl Grey")
p teas

looking_for = "Darjeeling"
result = teas.include?(looking_for)
if result
  p "Teas includes #{looking_for}"
else
  p "Teas does not include #{looking_for}"
end

coffees = ["French Roast", "Bold", "Latte"]
drinks = teas + coffees
p drinks