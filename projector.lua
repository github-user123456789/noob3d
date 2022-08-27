
-- intended for surfacegui, can be adapted to screengui if u want.
-- surface would be the surfacegui.

local focall = .3 * 2
local cam = Vector3.new(0, 0, -4)
local camrot = Vector3.new(0, 0, 0)

local function project(x, y, z, pos, rot)
	local XY, XZ, YZ, YX, ZX, ZY
	
	rot -= camrot
	
	local v = Vector3.new(x, y, z)
	XY = (math.cos(rot.y)*v.y)-(math.sin(rot.y)*v.z)
	XZ = (math.sin(rot.y)*v.y)+(math.cos(rot.y)*v.z)
	YZ = (math.cos(rot.x)*XZ)-(math.sin(rot.x)*v.x)
	YX = (math.sin(rot.x)*XZ)+(math.cos(rot.x)*v.x)
	ZX = (math.cos(rot.z)*YX)-(math.sin(rot.z)*XY)
	ZY = (math.sin(rot.z)*YX)+(math.cos(rot.z)*XY)
	
	local sf = focall/(focall+YZ+pos.z-cam.z)
	local X, Y = (ZX+pos.X-cam.X)*sf, (ZY+pos.Y-cam.y)*sf
	
	local CANV = surface.CanvasSize
	if CANV.x < CANV.y then
		Y /= surface.CanvasSize.y/surface.CanvasSize.x
	elseif CANV.x > CANV.y then
		X /= surface.CanvasSize.x/surface.CanvasSize.y
	end
	
	return X,Y
end

-- Ok
