local v_u_1 = table.concat
local v_u_2 = string.byte
local v3 = string.char
local v_u_4 = {}
local v_u_5 = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z",
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"!",
	"#",
	"$",
	"%",
	"&",
	"\'",
	"(",
	")",
	"*",
	"+",
	",",
	"-",
	".",
	"/",
	":",
	";",
	"<",
	"=",
	">",
	"?",
	"@",
	"[",
	"]",
	"^",
	"_",
	"`",
	"{",
	"|",
	"}",
	"~",
	" "
}
for v6 = 0, 255 do
	v_u_4[v6] = 255
end
for v7 = 0, #v_u_5 do
	v_u_4[v_u_2(v_u_5[v7])] = v7
end
local v_u_8 = {}
for v9 = 0, 30 do
	v_u_8[v9] = 2 ^ v9
end
local v_u_10 = {}
for v11 = 0, 255 do
	v_u_10[v11] = v3(v11)
end
return {
	["encode"] = function(p12)
		-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_5, (copy) v_u_1
		local v13 = 0
		local v14 = 0
		local v15 = {}
		local v16 = 1
		for v17 = 1, #p12 do
			v14 = v14 + v_u_2(p12, v17) * v_u_8[v13]
			v13 = v13 + 8
			while v13 > 13 do
				local v18 = v14 % 8192
				if v18 > 456 then
					v14 = v14 // 8192
					v13 = v13 - 13
				else
					v18 = v14 % 16384
					v14 = v14 // 16384
					v13 = v13 - 14
				end
				v15[v16] = v_u_5[v18 % 93]
				local v19 = v16 + 1
				v15[v19] = v_u_5[v18 // 93]
				v16 = v19 + 1
			end
		end
		if v13 > 0 then
			v15[v16] = v_u_5[v14 % 93]
			if v13 > 7 or v14 > 92 then
				v15[v16 + 1] = v_u_5[v14 // 93]
			end
		end
		return v_u_1(v15)
	end,
	["decode"] = function(p20)
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_1
		local v21 = #p20
		local v22 = v21 // 2 * 2
		local v23 = {}
		local v24 = 0
		local v25 = 0
		local v26 = 1
		for v27 = 1, v22, 2 do
			local v28, v29 = v_u_2(p20, v27, v27 + 1)
			local v30 = v_u_4[v28]
			local v31 = v_u_4[v29]
			if v30 == 255 or v31 == 255 then
				error("malformed base93 data stream")
			end
			local v32 = v30 + v31 * 93
			v25 = v25 + v32 * v_u_8[v24]
			v24 = v24 + (v32 % 8192 > 456 and 13 or 14)
			while v24 > 7 do
				v23[v26] = v_u_10[v25 % 256]
				v26 = v26 + 1
				v25 = v25 // 256
				v24 = v24 - 8
			end
		end
		if v22 < v21 then
			local v33 = v_u_4[v_u_2(p20, v21)]
			if v33 == 255 then
				error("malformed base93 data stream")
			end
			v23[v26] = v_u_10[v25 + v33 * v_u_8[v24]]
		end
		return v_u_1(v23)
	end
}
