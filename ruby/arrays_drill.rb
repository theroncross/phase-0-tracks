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