--[[
Gambling
]]--
function wanez.dga.dieGambleBeginner01(argObjectId)
	local player = Game.GetLocalPlayer()
	math.randomseed(Time.Now())
	local moneyValue = random(1,30000)
	player:AdjustMoney(moneyValue)
	UI.Notify("You just gambled: "..moneyValue.." Iron Bits")
end