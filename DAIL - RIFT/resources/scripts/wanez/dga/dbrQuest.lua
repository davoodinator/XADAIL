
function wanez.dga.questSpecial001Task01()
	--
	local retCredit = (wanez.dga.Data.Rewards:getSpecialCredit() == 0) && 1000000 || wanez.dga.Data.Rewards:getSpawnRating()
	return retCredit
end
