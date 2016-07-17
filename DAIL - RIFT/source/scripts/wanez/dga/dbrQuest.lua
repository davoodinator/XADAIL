
function wanez.dga.questSpecial001Task01()
	--
	local retCredit = (wanez.dga.Data.Rewards:getSpecialCredit() == 0) and 1000000 or wanez.dga.Data.Rewards:getSpawnRating()
	return retCredit
end
