/*
	
	GRIM DAWN
	scripts/libs/table.lua
	
	For more information visit us at http://www.grimdawn.com
	
*/

-- Create a table which can be iterated over using table:opairs() in the order of key insertion
function orderedTable()

	local t = {}
	local mt =
	{
	    __index     =   {
	                        __order =   {},
	                        opairs  =   function(self)
		                                    local i = 0
                                            local function iter(self)
                                                i = i + 1
                                                local key = self.__order[i]
                                                if (key ~= nil) then
                                                    return key, self[key]
                                                end
                                            end
                                            return iter, self
		                                end
	                    },
		__newindex 	= 	function(self, key, value)
							table.insert(self.__order, key)
							rawset(self, key, value)
						end
	}

	setmetatable(t, mt)
	
	return t

end