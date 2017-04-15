local roulette = require("roulette")
local tbl = {{"a",0.6},{"b",0.3},{"b",0.1}}
roulette.alias(tbl)

local a,b,c = 0,0,0
for i=1,10000 do
	local temp = roulette.next()
	if temp == 1 then
		a = a+1
	elseif temp == 2 then
		b = b+1
	else
		c = c+1
	end
end

print(a.."\n")
print(b.."\n")
print(c.."\n")