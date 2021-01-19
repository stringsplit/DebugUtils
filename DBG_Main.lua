local DebugUtils = {};

local function getupvalues(fn)
	assert(type(fn) == 'function', 'Argument type is not function got < '..type(fn)..' >')
	local allupvals = debug.getinfo(fn).nups
	for i = 1, allupvals do
		print('Idx:'..i, debug.getupvalue(fn, i))
	end
end

function DebugUtils.islclosure(func)
	assert(func, 'Argument #1 is not defined')
	assert(type(func) == 'function', 'Argument type is not function got < '..type(func)..' >')
	local info = debug.getinfo(func)
	if info.what == 'Lua' then
		return true
	else
		return false
	end
end

function DebugUtils.iscclosure(func)
	assert(func, 'Argument #1 is not defined')
	assert(type(func) == 'function', 'Argument type is not function got < '..type(func)..' >')
	local info = debug.getinfo(func)
	if info.what == 'C' then
		return true
	else
		return false
	end
end

function DebugUtils.SetUps(func, val)
	assert(func, 'Argument #1 is not defined')
	assert(type(func) == 'function', 'Argument #1 is not function got < '..type(func)..' >')
	assert(val, 'Argument #2 is not defined')
	local info = debug.getinfo(func).nups
	if info == 1 then
		getupvalues(func)
		print('\n')
		ch = io.write('Are you sure? (yes or no): ')
		ch = io.read()
		if ch:lower() == 'yes' or ch:lower() == 'y' then
			return debug.setupvalue(func, info, val)
		elseif ch:lower() == 'no' or ch:lower() == 'n' then
			print('Operation is canceled')
			return
		end
	elseif info >= 2 then
		print('Number of upval is 2 or higher choose the upval: \nAll upvalues: \n')
		getupvalues(func)
		t = io.write('-> ')
		t = io.read()
		if tonumber(t) > info then
			return error'the level is not valid'
		else
			return debug.setupvalue(func, t, val)
		end
	end
end

return DebugUtils