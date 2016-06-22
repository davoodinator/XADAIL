/*
	
	GRIM DAWN
	scripts/libs/vector.lua
	
	For more information visit us at http://www.grimdawn.com
	
*/

-- Return the length of the vector
function Vec:Length()

	local x = self.x
	local y = self.y
	local z = self.z
	
	return sqrt(x * x + y * y + z * z)
	
end

-- Return the length of the vector on the XZ plane
function Vec:LengthXZ()

	local x = self.x
	local z = self.z
	
	return sqrt(x * x + z * z)
	
end
	
-- Return the length squared of the vector
function Vec:LengthSquared()

	local x = self.x
	local y = self.y
	local z = self.z
	
	return x * x + y * y + z * z
	
end

-- Return the length squared of the vector on the XZ plane
function Vec:LengthSquaredXZ()

	local x = self.x
	local z = self.z
	
	return x * x + z * z
	
end

-- Return the unit direction of the vector
function Vec:Unit()

	local x = self.x
	local y = self.y
	local z = self.z
	
	local invLength = 1.0 / sqrt(x * x + y * y + z * z)
	
	return Vec(x * invLength, y * invLength, z * invLength)

end

-- Return the dot product of two vectors
function DotProduct(a, b)

	return a.x * b.x + a.y * b.y + a.z * b.z

end

-- Return the cross product of two vectors
function CrossProduct(a, b)

	local ax = a.x
	local ay = a.y
	local az = a.z
	local bx = b.x
	local by = b.y
	local bz = b.z

	return Vector(ay * bz - az * by, az * bx - ax * bz, ax * by - ay * bx)

end