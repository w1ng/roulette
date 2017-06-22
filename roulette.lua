local roulette = {}

local probability = {}
local alias = {}

function roulette.alias(probabilities)

	assert(probabilities ,"table can not be nil")
	assert(#probabilities ~= 0,"table can not be empty")

	math.randomseed(os.time())
	math.random()
        math.random()
        math.random()
        math.random()
	-- 可以用quick中的方法初始化更随机的种子
	-- math.newrandomseed()
	


	local average = 1/#probabilities

	local small = {}
	local large = {}

	for i,v in ipairs(probabilities) do
		if v[2] >= average then
			table.insert(large,i)
		else
			table.insert(small,i)
		end
	end

	while #small > 0 and #large > 0 do
		local less = small[#small]
		table.remove(small,#small)

		local more = large[#large]
		table.remove(large,#large)

		probability[less] = probabilities[less][2]*#probabilities
		alias[less] = more

		if probabilities[more][2] >= 1/#probabilities then
			table.insert(large,more)
		else
			table.insert(small,more)
		end
	end

	while #small > 0 do
	   local less = small[#small]
		table.remove(small,#small)

		probability[less] = 1.0
	end

	while #large > 0 do
		local more = large[#large]
		table.remove(large,#large)

		probability[more] = 1.0
	end
end

function roulette.next()
	local column = math.random(#probability)

	local nextDouble = math.random(0,100)/100
	local coinToss  = false
	if nextDouble <= probability[column] then
		coinToss = true
	end
	
	if coinToss then
		return column
	end

	return alias[column]
end


return roulette 
