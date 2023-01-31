local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local SequentialText = require(script.Parent.Parent.Parent.Template.SequentialText)
local e = Roact.createElement


local function createTextFragments()
	
	local fragments = {}
	
	for i = 1, 14 do
		-- generate two random numbers that represent most of A-Z in ASCII table
		local abbreviation = ""
		
		for _ = 1, 2 do
			local firstDigit, secondDigit = math.random(6, 8), math.random(5, 9)
			local digit = firstDigit .. secondDigit
			local asciiChar = string.char(digit)
			abbreviation = abbreviation .. asciiChar
		end
		
		fragments[i] = e(SequentialText, {
			abbreviation = abbreviation,
			active = true,
		})
	end
	
	return Roact.createFragment(fragments)
end

return function(props)
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(51, 0, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = props.Position,
		Size = props.Size,
	}, {

		uIListLayout = e("UIListLayout", {
			SortOrder = "LayoutOrder",
		}),
		
		texts = createTextFragments(),
		
	})
end