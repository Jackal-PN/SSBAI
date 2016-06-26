
function writememcode(s, startup)
	s = "\n"..s
	local button = input.get().F11
	local repeater
	local check = false	-- trueなら実行しない
	function types(type, addr, value)
		if type == 0x50 then
			repeater = {count=BITS(addr,8,8),inc=BITS(addr,0,8),valueinc=value}
		elseif type == 0x80 then
			memory.SB(addr+0x80000000, value)
		elseif type == 0x81 then
			memory.SH(addr+0x80000000, value)
		elseif type == 0x82 then	-- 独自拡張
			memory.SW(addr+0x80000000, value)
		elseif type == 0x88 and button then
			memory.SB(addr+0x80000000, value)
		elseif type == 0x89 and button then
			memory.SH(addr+0x80000000, value)
		elseif type == 0x8A and button then	-- 独自拡張
			memory.SW(addr+0x80000000, value)
		elseif type == 0xA0 and startup then
			memory.SB(addr+0x80000000, value)
		elseif type == 0xA1 and startup then
			memory.SH(addr+0x80000000, value)
		elseif type == 0xA2 and startup then
			memory.SW(addr+0x80000000, value)	-- 独自拡張
		elseif type == 0xD0 then
			check = memory.LBU(addr+0x80000000) ~= value
		elseif type == 0xD1 then
			check = memory.LHU(addr+0x80000000) ~= value
		elseif type == 0xD2 then	-- 独自拡張
			check = memory.LWU(addr+0x80000000) ~= value
		end
	end
	for a, n in string.gmatch(s, "\n[\s\t]*(%x+) (%x+)[^\n]*") do
		local command, value = tonumber(a,16),tonumber(n,16)
		local type, addr = math.floor(command/0x1000000), command%0x1000000
		if check then
			check = false
		else
			if repeater then
				for i = 0, repeater.count-1 do
					types(type, addr+i*repeater.inc, value+i*repeater.valueinc)
				end
				repeater = nil
			else
				types(type, addr, value)
			end
		end
	end
end

function addcheat(s)
	emu.atvi(function()
		writememcode(s)
	end)
end

addcheat[[
-- SSB(J)

--"すべてのキャラクターそろう"
810A28F8 0FF0
--"VS. モード\いにしえの王国選択できる"
800A28F7 00FF

]]
