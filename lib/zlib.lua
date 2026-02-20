local v1 = {}
local v_u_2 = {}
v1.Deflate = {}
v1.Zlib = {}
v1.Library = v_u_2
local function v5(p3, p4)
	-- upvalues: (ref) v_u_2
	return v_u_2:CompressDeflate(p3, p4)
end
v1.Deflate.Compress = v5
local function v7(p6)
	-- upvalues: (ref) v_u_2
	return v_u_2:DecompressDeflate(p6)
end
v1.Deflate.Decompress = v7
local function v10(p8, p9)
	-- upvalues: (ref) v_u_2
	return v_u_2:CompressZlib(p8, p9)
end
v1.Zlib.Compress = v10
local function v12(p11)
	-- upvalues: (ref) v_u_2
	return v_u_2:DecompressZlib(p11)
end
v1.Zlib.Decompress = v12
v_u_2 = {
	["_VERSION"] = "1.0.2-release",
	["_MAJOR"] = "LibDeflate",
	["_MINOR"] = 3,
	["_COPYRIGHT"] = "LibDeflate 1.0.2-release Copyright (C) 2018-2020 Haoqian He. Licensed under the zlib License"
}
local v_u_13 = assert
local v_u_14 = error
local v_u_15 = pairs
local v_u_16 = string.byte
local v_u_17 = string.char
local v_u_18 = string.find
local v_u_19 = string.gsub
local v_u_20 = string.sub
local v_u_21 = table.concat
local v_u_22 = table.sort
local v_u_23 = tostring
local v_u_24 = type
local v_u_25 = v_u_2
local v_u_26 = {}
local v_u_27 = {}
local v_u_28 = {}
local v_u_29 = {}
local v_u_30 = {}
local v_u_31 = {}
local v_u_32 = {}
local v_u_33 = {}
local v_u_34 = {}
local v_u_35 = {
	16,
	17,
	18,
	0,
	8,
	7,
	9,
	6,
	10,
	5,
	11,
	4,
	12,
	3,
	13,
	2,
	14,
	1,
	15
}
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = {
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	1,
	1,
	1,
	1,
	2,
	2,
	2,
	2,
	3,
	3,
	3,
	3,
	4,
	4,
	4,
	4,
	5,
	5,
	5,
	5,
	0
}
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = {
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	13,
	15,
	17,
	19,
	23,
	27,
	31,
	35,
	43,
	51,
	59,
	67,
	83,
	99,
	115,
	131,
	163,
	195,
	227,
	258
}
local v_u_42 = nil
local v_u_43 = {
	1,
	2,
	3,
	4,
	5,
	7,
	9,
	13,
	17,
	25,
	33,
	49,
	65,
	97,
	129,
	193,
	257,
	385,
	513,
	769,
	1025,
	1537,
	2049,
	3073,
	4097,
	6145,
	8193,
	12289,
	16385,
	24577
}
local v_u_44 = {
	0,
	0,
	0,
	0,
	1,
	1,
	2,
	2,
	3,
	3,
	4,
	4,
	5,
	5,
	6,
	6,
	7,
	7,
	8,
	8,
	9,
	9,
	10,
	10,
	11,
	11,
	12,
	12,
	13,
	13
}
local v_u_45 = nil
local v_u_46 = nil
for v47 = 0, 255 do
	v_u_26[v47] = v_u_17(v47)
end
local v48 = 1
for v49 = 0, 32 do
	v_u_27[v49] = v48
	v48 = v48 * 2
end
for v50 = 1, 9 do
	v_u_28[v50] = {}
	for v55 = 0, v_u_27[v50 + 1] - 1 do
		local v52 = v55
		local v53 = 0
		for _ = 1, v50 do
			local v54 = v53 - v53 % 2 + ((v53 % 2 == 1 or v55 % 2 == 1) and 1 or 0)
			local v55 = (v55 - v55 % 2) / 2
			v53 = v54 * 2
		end
		v_u_28[v50][v52] = (v53 - v53 % 2) / 2
	end
end
local v56 = 1
local v57 = 18
local v58 = 16
local v59 = 265
for v60 = 3, 258 do
	if v60 <= 10 then
		v_u_30[v60] = v60 + 254
		v_u_31[v60] = 0
	elseif v60 == 258 then
		v_u_30[v60] = 285
		v_u_31[v60] = 0
	else
		if v57 < v60 then
			v57 = v57 + v58
			v58 = v58 * 2
			v59 = v59 + 4
			v56 = v56 + 1
		end
		local v61 = v60 - v57 - 1 + v58 / 2
		v_u_30[v60] = (v61 - v61 % (v58 / 8)) / (v58 / 8) + v59
		v_u_31[v60] = v56
		v_u_29[v60] = v61 % (v58 / 8)
	end
end
v_u_32[1] = 0
v_u_32[2] = 1
v_u_33[1] = 0
v_u_33[2] = 0
local v62 = 4
local v63 = 3
local v64 = 2
local v65 = 0
for v66 = 3, 256 do
	if v62 < v66 then
		v63 = v63 * 2
		v62 = v62 * 2
		v64 = v64 + 2
		v65 = v65 + 1
	end
	v_u_32[v66] = v66 <= v63 and v64 and v64 or v64 + 1
	v_u_33[v66] = v65 < 0 and 0 or v65
	if v62 >= 8 then
		v_u_34[v66] = (v66 - v62 / 2 - 1) % (v62 / 4)
	end
end
function v_u_25.Adler32(_, p67)
	-- upvalues: (copy) v_u_24, (copy) v_u_14, (copy) v_u_16
	if v_u_24(p67) ~= "string" then
		v_u_14(("Usage: LibDeflate:Adler32(str): \'str\' - string expected got \'%s\'."):format((v_u_24(p67))), 2)
	end
	local v68 = #p67
	local v69 = 1
	local v70 = 1
	local v71 = 0
	while v69 <= v68 - 15 do
		local v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87 = v_u_16(p67, v69, v69 + 15)
		v71 = (v71 + v70 * 16 + v72 * 16 + 15 * v73 + 14 * v74 + 13 * v75 + 12 * v76 + 11 * v77 + 10 * v78 + 9 * v79 + 8 * v80 + 7 * v81 + 6 * v82 + 5 * v83 + 4 * v84 + 3 * v85 + 2 * v86 + v87) % 65521
		v70 = (v70 + v72 + v73 + v74 + v75 + v76 + v77 + v78 + v79 + v80 + v81 + v82 + v83 + v84 + v85 + v86 + v87) % 65521
		v69 = v69 + 16
	end
	while v69 <= v68 do
		v70 = (v70 + v_u_16(p67, v69, v69)) % 65521
		v71 = (v71 + v70) % 65521
		v69 = v69 + 1
	end
	return (v71 * 65536 + v70) % 4294967296
end
local function v90(p88, p89)
	return p88 % 4294967296 == p89 % 4294967296
end
function v_u_25.CreateDictionary(p91, p92, p93, p94)
	-- upvalues: (copy) v_u_24, (copy) v_u_14, (copy) v_u_16
	if v_u_24(p92) ~= "string" then
		v_u_14(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'str\' - string expected got \'%s\'."):format((v_u_24(p92))), 2)
	end
	if v_u_24(p93) ~= "number" then
		v_u_14(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'strlen\' - number expected got \'%s\'."):format((v_u_24(p93))), 2)
	end
	if v_u_24(p94) ~= "number" then
		v_u_14(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'adler32\' - number expected got \'%s\'."):format((v_u_24(p94))), 2)
	end
	if p93 ~= #p92 then
		v_u_14(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'strlen\' does not match the actual length of \'str\'. \'strlen\': %u, \'#str\': %u . Please check if \'str\' is modified unintentionally."):format(p93, #p92))
	end
	if p93 == 0 then
		v_u_14("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'str\' - Empty string is not allowed.", 2)
	end
	if p93 > 32768 then
		v_u_14(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'str\' - string longer than 32768 bytes is not allowed. Got %d bytes."):format(p93), 2)
	end
	local v95 = p91:Adler32(p92)
	if p94 % 4294967296 ~= v95 % 4294967296 then
		v_u_14(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): \'adler32\' does not match the actual adler32 of \'str\'. \'adler32\': %u, \'Adler32(str)\': %u . Please check if \'str\' is modified unintentionally."):format(p94, v95))
	end
	local v96 = {
		["adler32"] = p94,
		["hash_tables"] = {},
		["string_table"] = {},
		["strlen"] = p93
	}
	local v97 = v96.string_table
	local v98 = v96.hash_tables
	v97[1] = v_u_16(p92, 1, 1)
	v97[2] = v_u_16(p92, 2, 2)
	if p93 >= 3 then
		local v99 = v97[1] * 256 + v97[2]
		local v100 = 1
		while v100 <= p93 - 2 - 3 do
			local v101, v102, v103, v104 = v_u_16(p92, v100 + 2, v100 + 5)
			v97[v100 + 2] = v101
			v97[v100 + 3] = v102
			v97[v100 + 4] = v103
			v97[v100 + 5] = v104
			local v105 = (v99 * 256 + v101) % 16777216
			local v106 = v98[v105]
			if not v106 then
				v106 = {}
				v98[v105] = v106
			end
			v106[#v106 + 1] = v100 - p93
			local v107 = v100 + 1
			local v108 = (v105 * 256 + v102) % 16777216
			local v109 = v98[v108]
			if not v109 then
				v109 = {}
				v98[v108] = v109
			end
			v109[#v109 + 1] = v107 - p93
			local v110 = v107 + 1
			local v111 = (v108 * 256 + v103) % 16777216
			local v112 = v98[v111]
			if not v112 then
				v112 = {}
				v98[v111] = v112
			end
			v112[#v112 + 1] = v110 - p93
			local v113 = v110 + 1
			v99 = (v111 * 256 + v104) % 16777216
			local v114 = v98[v99]
			if not v114 then
				v114 = {}
				v98[v99] = v114
			end
			v114[#v114 + 1] = v113 - p93
			v100 = v113 + 1
		end
		while v100 <= p93 - 2 do
			local v115 = v_u_16(p92, v100 + 2)
			v97[v100 + 2] = v115
			v99 = (v99 * 256 + v115) % 16777216
			local v116 = v98[v99]
			if not v116 then
				v116 = {}
				v98[v99] = v116
			end
			v116[#v116 + 1] = v100 - p93
			v100 = v100 + 1
		end
	end
	return v96
end
local function v_u_118(p117)
	-- upvalues: (copy) v_u_24
	if v_u_24(p117) == "table" then
		if v_u_24(p117.adler32) == "number" and (v_u_24(p117.string_table) == "table" and (v_u_24(p117.strlen) == "number" and (p117.strlen > 0 and (p117.strlen <= 32768 and (p117.strlen == #p117.string_table and v_u_24(p117.hash_tables) == "table"))))) then
			return true, ""
		else
			return false, ("\'dictionary\' - corrupted dictionary."):format((v_u_24(p117)))
		end
	else
		return false, ("\'dictionary\' - table expected got \'%s\'."):format((v_u_24(p117)))
	end
end
local v_u_119 = {
	[0] = {
		false,
		nil,
		0,
		0,
		0
	},
	[1] = {
		false,
		nil,
		4,
		8,
		4
	},
	[2] = {
		false,
		nil,
		5,
		18,
		8
	},
	[3] = {
		false,
		nil,
		6,
		32,
		32
	},
	[4] = {
		true,
		4,
		4,
		16,
		16
	},
	[5] = {
		true,
		8,
		16,
		32,
		32
	},
	[6] = {
		true,
		8,
		16,
		128,
		128
	},
	[7] = {
		true,
		8,
		32,
		128,
		256
	},
	[8] = {
		true,
		32,
		128,
		258,
		1024
	},
	[9] = {
		true,
		32,
		258,
		258,
		4096
	}
}
local function v_u_130(p120, p121, p122, p123, p124)
	-- upvalues: (copy) v_u_24, (copy) v_u_118, (copy) v_u_15, (copy) v_u_119, (copy) v_u_23
	if v_u_24(p120) ~= "string" then
		return false, ("\'str\' - string expected got \'%s\'."):format((v_u_24(p120)))
	end
	if p121 then
		local v125, v126 = v_u_118(p122)
		if not v125 then
			return false, v126
		end
	end
	if p123 then
		local v127 = v_u_24(p124)
		if v127 ~= "nil" and v127 ~= "table" then
			return false, ("\'configs\' - nil or table expected got \'%s\'."):format((v_u_24(p124)))
		end
		if v127 == "table" then
			for v128, v129 in v_u_15(p124) do
				if v128 ~= "level" and v128 ~= "strategy" then
					return false, ("\'configs\' - unsupported table key in the configs: \'%s\'."):format(v128)
				end
				if v128 == "level" and not v_u_119[v129] then
					return false, ("\'configs\' - unsupported \'level\': %s."):format((v_u_23(v129)))
				end
				if v128 == "strategy" and (v129 ~= "fixed" and (v129 ~= "huffman_only" and v129 ~= "dynamic")) then
					return false, ("\'configs\' - unsupported \'strategy\': \'%s\'."):format((v_u_23(v129)))
				end
			end
		end
	end
	return true, ""
end
local function v_u_144()
	-- upvalues: (copy) v_u_27, (copy) v_u_26, (copy) v_u_17, (copy) v_u_21
	local v_u_131 = 0
	local v_u_132 = 0
	local v_u_133 = 0
	local v_u_134 = 0
	local v_u_135 = {}
	local v_u_136 = {}
	return function(p137, p138)
		-- upvalues: (ref) v_u_132, (ref) v_u_27, (ref) v_u_133, (ref) v_u_134, (ref) v_u_131, (ref) v_u_135, (ref) v_u_26
		v_u_132 = v_u_132 + p137 * v_u_27[v_u_133]
		v_u_133 = v_u_133 + p138
		v_u_134 = v_u_134 + p138
		if v_u_133 >= 32 then
			v_u_131 = v_u_131 + 1
			v_u_135[v_u_131] = v_u_26[v_u_132 % 256] .. v_u_26[(v_u_132 - v_u_132 % 256) / 256 % 256] .. v_u_26[(v_u_132 - v_u_132 % 65536) / 65536 % 256] .. v_u_26[(v_u_132 - v_u_132 % 16777216) / 16777216 % 256]
			local v139 = v_u_27[32 - v_u_133 + p138]
			v_u_132 = (p137 - p137 % v139) / v139
			v_u_133 = v_u_133 - 32
		end
	end, function(p140)
		-- upvalues: (ref) v_u_133, (ref) v_u_131, (ref) v_u_135, (ref) v_u_132, (ref) v_u_17, (ref) v_u_134
		for _ = 1, v_u_133, 8 do
			v_u_131 = v_u_131 + 1
			v_u_135[v_u_131] = v_u_17(v_u_132 % 256)
			v_u_132 = (v_u_132 - v_u_132 % 256) / 256
		end
		v_u_133 = 0
		v_u_131 = v_u_131 + 1
		v_u_135[v_u_131] = p140
		v_u_134 = v_u_134 + #p140 * 8
	end, function(p141)
		-- upvalues: (ref) v_u_134, (ref) v_u_133, (ref) v_u_132, (ref) v_u_27, (ref) v_u_131, (ref) v_u_135, (ref) v_u_26, (ref) v_u_21, (copy) v_u_136
		if p141 == 3 then
			return v_u_134
		else
			if p141 == 1 or p141 == 2 then
				local v142 = (8 - v_u_133 % 8) % 8
				if v_u_133 > 0 then
					v_u_132 = v_u_132 - v_u_27[v_u_133] + v_u_27[v_u_133 + v142]
					for _ = 1, v_u_133, 8 do
						v_u_131 = v_u_131 + 1
						v_u_135[v_u_131] = v_u_26[v_u_132 % 256]
						v_u_132 = (v_u_132 - v_u_132 % 256) / 256
					end
					v_u_132 = 0
					v_u_133 = 0
				end
				if p141 == 2 then
					v_u_134 = v_u_134 + v142
					return v_u_134
				end
			end
			local v143 = v_u_21(v_u_135)
			v_u_135 = {}
			v_u_131 = 0
			v_u_136[#v_u_136 + 1] = v143
			if p141 == 0 then
				return v_u_134
			else
				return v_u_134, v_u_21(v_u_136)
			end
		end
	end
end
local function v_u_153(p145, p146, p147)
	local v148 = p147 + 1
	p145[v148] = p146
	local v149 = p146[1]
	local v150 = (v148 - v148 % 2) / 2
	while v150 >= 1 and v149 < p145[v150][1] do
		local v151 = p145[v150]
		p145[v150] = p146
		p145[v148] = v151
		local v152 = (v150 - v150 % 2) / 2
		v148 = v150
		v150 = v152
	end
end
local function v_u_167(p154, p155)
	local v156 = p154[1]
	local v157 = p154[p155]
	local v158 = v157[1]
	p154[1] = v157
	p154[p155] = v156
	local v159 = p155 - 1
	local v160 = 1
	local v161 = v160 * 2
	local v162 = v161 + 1
	while v161 <= v159 do
		local v163 = p154[v161]
		local v164
		if v162 <= v159 and p154[v162][1] < v163[1] then
			local v165 = p154[v162]
			if v165[1] >= v158 then
				break
			end
			p154[v162] = v157
			p154[v160] = v165
			v164 = v162 * 2
			local v166 = v164 + 1
			v161 = v162
			v162 = v166
		else
			if v163[1] >= v158 then
				break
			end
			p154[v161] = v157
			p154[v160] = v163
			v164 = v161 * 2
			v162 = v164 + 1
		end
		v160 = v161
		v161 = v164
	end
	return v156
end
local function v_u_181(p168, p169, p170, p171)
	-- upvalues: (copy) v_u_28
	local v172 = 0
	local v173 = {}
	local v174 = {}
	for v175 = 1, p171 do
		v172 = (v172 + (p168[v175 - 1] or 0)) * 2
		v173[v175] = v172
	end
	for v176 = 0, p170 do
		local v177 = p169[v176]
		if v177 then
			local v178 = v173[v177]
			v173[v177] = v178 + 1
			if v177 <= 9 then
				v174[v176] = v_u_28[v177][v178]
			else
				local v179 = 0
				for _ = 1, v177 do
					local v180 = v179 - v179 % 2 + ((v179 % 2 == 1 or v178 % 2 == 1) and 1 or 0)
					v178 = (v178 - v178 % 2) / 2
					v179 = v180 * 2
				end
				v174[v176] = (v179 - v179 % 2) / 2
			end
		end
	end
	return v174
end
local function v_u_185(p182, p183)
	local v184
	if p182[1] < p183[1] then
		v184 = true
	elseif p182[1] == p183[1] then
		v184 = p182[2] < p183[2]
	else
		v184 = false
	end
	return v184
end
local function v_u_217(p186, p187, p188)
	-- upvalues: (copy) v_u_15, (copy) v_u_22, (copy) v_u_185, (copy) v_u_167, (copy) v_u_153, (copy) v_u_181
	local v189 = 0
	local v190 = {}
	local v191 = {}
	local v192 = {}
	local v193 = -1
	local v194 = {}
	local v195 = {}
	for v196, v197 in v_u_15(p186) do
		v189 = v189 + 1
		v190[v189] = { v197, v196 }
	end
	if v189 == 0 then
		return {}, {}, -1
	end
	if v189 == 1 then
		local v198 = v190[1][2]
		v192[v198] = 1
		v195[v198] = 0
		return v192, v195, v198
	end
	v_u_22(v190, v_u_185)
	for v199 = 1, v189 do
		v191[v199] = v190[v199]
	end
	while v189 > 1 do
		local v200 = v_u_167(v191, v189)
		local v201 = v189 - 1
		local v202 = v_u_167(v191, v201)
		local v203 = v201 - 1
		v_u_153(v191, {
			v200[1] + v202[1],
			-1,
			v200,
			v202
		}, v203)
		v189 = v203 + 1
	end
	local v204 = {
		v191[1],
		0,
		0,
		0
	}
	v191[1][1] = 0
	local v205 = 1
	local v206 = 1
	local v207 = 0
	while v205 <= v206 do
		local v208 = v204[v205]
		local v209 = v208[1]
		local v210 = v208[2]
		local v211 = v208[3]
		local v212 = v208[4]
		if v211 then
			v206 = v206 + 1
			v204[v206] = v211
			v211[1] = v209 + 1
		end
		if v212 then
			v206 = v206 + 1
			v204[v206] = v212
			v212[1] = v209 + 1
		end
		v205 = v205 + 1
		if p187 < v209 then
			v207 = v207 + 1
			v209 = p187
		end
		if v210 >= 0 then
			v192[v210] = v209
			if v193 < v210 then
				v193 = v210 or v193
			end
			v194[v209] = (v194[v209] or 0) + 1
		end
	end
	if v207 > 0 then
		while true do
			local v213 = p187 - 1
			while (v194[v213] or 0) == 0 do
				v213 = v213 - 1
			end
			v194[v213] = v194[v213] - 1
			v194[v213 + 1] = (v194[v213 + 1] or 0) + 2
			v194[p187] = v194[p187] - 1
			v207 = v207 - 2
			if v207 <= 0 then
				local v214 = 1
				for v215 = p187, 1, -1 do
					local v216 = v194[v215] or 0
					while v216 > 0 do
						v192[v190[v214][2]] = v215
						v216 = v216 - 1
						v214 = v214 + 1
					end
				end
				goto l28
			end
		end
	else
		::l28::
		return v192, v_u_181(v194, v192, p188, p187), v193
	end
end
local function v_u_234(p218, p219, p220, p221)
	local v222 = p219 + (p221 < 0 and 0 or p221) + 1
	local v223 = nil
	local v224 = {}
	local v225 = 0
	local v226 = 0
	local v227 = {}
	local v228 = 0
	local v229 = {}
	for v230 = 0, v222 + 1 do
		local v231
		if v230 <= p219 then
			v231 = p218[v230] or 0
		else
			v231 = v230 <= v222 and (p220[v230 - p219 - 1] or 0) or nil
		end
		if v231 == v223 then
			v225 = v225 + 1
			if v231 == 0 or v225 ~= 6 then
				if v231 == 0 and v225 == 138 then
					v226 = v226 + 1
					v227[v226] = 18
					v228 = v228 + 1
					v229[v228] = 127
					v224[18] = (v224[18] or 0) + 1
					v225 = 0
				end
			else
				v226 = v226 + 1
				v227[v226] = 16
				v228 = v228 + 1
				v229[v228] = 3
				v224[16] = (v224[16] or 0) + 1
				v225 = 0
			end
		else
			if v225 == 1 then
				v226 = v226 + 1
				v227[v226] = v223
				v224[v223] = (v224[v223] or 0) + 1
			elseif v225 == 2 then
				local v232 = v226 + 1
				v227[v232] = v223
				v226 = v232 + 1
				v227[v226] = v223
				v224[v223] = (v224[v223] or 0) + 2
			elseif v225 >= 3 then
				v226 = v226 + 1
				local v233 = v223 == 0 and (v225 <= 10 and 17 or 18) or 16
				v227[v226] = v233
				v224[v233] = (v224[v233] or 0) + 1
				v228 = v228 + 1
				v229[v228] = v225 <= 10 and v225 - 3 or v225 - 11
			end
			if v231 and v231 ~= 0 then
				v226 = v226 + 1
				v227[v226] = v231
				v224[v231] = (v224[v231] or 0) + 1
				v223 = v231
				v225 = 0
			else
				v223 = v231
				v225 = 1
			end
		end
	end
	return v227, v229, v224
end
local function v_u_272(p235, p236, p237, p238, p239)
	-- upvalues: (copy) v_u_16
	local v240 = p237 - p239
	while v240 <= p238 - 15 - p239 do
		local v241 = v240 + 1
		local v242 = v240 + 2
		local v243 = v240 + 3
		local v244 = v240 + 4
		local v245 = v240 + 5
		local v246 = v240 + 6
		local v247 = v240 + 7
		local v248 = v240 + 8
		local v249 = v240 + 9
		local v250 = v240 + 10
		local v251 = v240 + 11
		local v252 = v240 + 12
		local v253 = v240 + 13
		local v254 = v240 + 14
		local v255 = v240 + 15
		local v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271 = v_u_16(p235, v240 + p239, v240 + 15 + p239)
		p236[v240] = v256
		p236[v241] = v257
		p236[v242] = v258
		p236[v243] = v259
		p236[v244] = v260
		p236[v245] = v261
		p236[v246] = v262
		p236[v247] = v263
		p236[v248] = v264
		p236[v249] = v265
		p236[v250] = v266
		p236[v251] = v267
		p236[v252] = v268
		p236[v253] = v269
		p236[v254] = v270
		p236[v255] = v271
		v240 = v240 + 16
	end
	while v240 <= p238 - p239 do
		p236[v240] = v_u_16(p235, v240 + p239, v240 + p239)
		v240 = v240 + 1
	end
	return p236
end
local function v_u_341(p273, p274, p275, p276, p277, p278, p279)
	-- upvalues: (copy) v_u_119, (copy) v_u_13, (copy) v_u_30, (copy) v_u_31, (copy) v_u_32, (copy) v_u_34, (copy) v_u_33, (copy) v_u_29
	local v280 = v_u_119[p273]
	local v281 = v280[1]
	local v282 = v280[2]
	local v283 = v280[3]
	local v284 = v280[4]
	local v285 = v280[5]
	local v286 = (v281 or not v283) and 2147483646 or v283
	local v287 = v285 - v285 % 4 / 4
	local v288, v289, v290
	if p279 then
		v288 = p279.hash_tables
		v289 = p279.string_table
		v290 = p279.strlen
		v_u_13(p276 == 1)
		if p276 <= p277 and v290 >= 2 then
			local v291 = v289[v290 - 1] * 65536 + v289[v290] * 256 + p274[1]
			local v292 = p275[v291]
			if not v292 then
				v292 = {}
				p275[v291] = v292
			end
			v292[#v292 + 1] = -1
		end
		if p276 + 1 <= p277 and v290 >= 1 then
			local v293 = v289[v290] * 65536 + p274[1] * 256 + p274[2]
			local v294 = p275[v293]
			if not v294 then
				v294 = {}
				p275[v293] = v294
			end
			v294[#v294 + 1] = 0
		end
	else
		v290 = 0
		v289 = nil
		v288 = nil
	end
	local v295 = v290 + 3
	local v296 = (p274[p276 - p278] or 0) * 256 + (p274[p276 + 1 - p278] or 0)
	local v297 = p277 + (v281 and 1 or 0)
	local v298 = 0
	local v299 = 0
	local v300 = {}
	local v301 = {}
	local v302 = {}
	local v303 = false
	local v304 = 0
	local v305 = 0
	local v306 = {}
	local v307 = 0
	local v308 = 0
	local v309 = {}
	local v310 = {}
	while true do
		if p276 > v297 then
			v300[v305 + 1] = 256
			v306[256] = (v306[256] or 0) + 1
			return v300, v301, v306, v310, v302, v309
		end
		local v311 = p276 - p278
		local v312 = p278 - 3
		local v313 = 0
		v296 = (v296 * 256 + (p274[v311 + 2] or 0)) % 16777216
		local v314 = nil
		local v315 = p275[v296]
		local v316, v317, v318
		if v315 then
			v316 = #v315
			v317 = v315
			v318 = v316
		else
			v318 = 0
			v317 = {}
			p275[v296] = v317
			if v288 then
				v315 = v288[v296]
				v316 = v315 and (#v315 or 0) or 0
			else
				v315 = v314
				v316 = 0
			end
		end
		if p276 <= p277 then
			v317[v318 + 1] = p276
		end
		local v319, v320
		if v316 > 0 and (p276 + 2 <= p277 and (not v281 or v298 < v283)) then
			local v321
			if v281 and (v282 <= v298 and v287) then
				v321 = v287
			else
				v321 = v285
			end
			local v322 = p277 - p276
			local v323 = (v322 >= 257 and 257 or v322) + v311
			local v324 = v311 + 3
			v319 = v299
			while true do
				if v316 < 1 or v321 <= 0 then
					v320 = v313
					break
				end
				local v325 = v315[v316]
				if p276 - v325 > 32768 then
					v320 = v313
					break
				end
				local v326
				if v325 < p276 then
					if v325 >= -257 then
						local v327 = v325 - v312
						v326 = v324
						while v324 <= v323 and p274[v327] == p274[v324] do
							v324 = v324 + 1
							v327 = v327 + 1
						end
					else
						local v328 = v295 + v325
						local v329 = v324
						while v329 <= v323 and v289[v328] == p274[v329] do
							v329 = v329 + 1
							v328 = v328 + 1
						end
						v326 = v324
						v324 = v329
					end
					v320 = v324 - v311
					if v313 < v320 then
						v319 = p276 - v325
					else
						v320 = v313
					end
					if v284 <= v320 then
						break
					end
				else
					v326 = v324
					v320 = v313
				end
				v316 = v316 - 1
				v321 = v321 - 1
				if v316 == 0 and (v325 > 0 and v288) then
					v315 = v288[v296]
					v316 = v315 and (#v315 or 0) or 0
				end
				v324 = v326
				v313 = v320
			end
		else
			v320 = v313
			v319 = v299
		end
		if not v281 then
			v298 = v320
			v299 = v319
		end
		if v281 and not v303 or (v298 <= 3 and (v298 ~= 3 or v299 >= 4096) or v320 > v298) then
			if v281 and not v303 then
				p276 = p276 + 1
				v303 = true
			else
				if v281 then
					v311 = v311 - 1 or v311
				end
				local v330 = p274[v311]
				v305 = v305 + 1
				v300[v305] = v330
				v306[v330] = (v306[v330] or 0) + 1
				p276 = p276 + 1
			end
		else
			local v331 = v_u_30[v298]
			local v332 = v_u_31[v298]
			local v333, v334, v335
			if v299 <= 256 then
				v333 = v_u_32[v299]
				v334 = v_u_34[v299]
				v335 = v_u_33[v299]
			else
				local v336 = 384
				local v337 = 512
				v335 = 7
				v333 = 16
				while true do
					if v299 <= v336 then
						v334 = (v299 - v337 / 2 - 1) % (v337 / 4)
					end
					if v299 <= v337 then
						v334 = (v299 - v337 / 2 - 1) % (v337 / 4)
						v333 = v333 + 1
					end
					v333 = v333 + 2
					v335 = v335 + 1
					v336 = v336 * 2
					v337 = v337 * 2
				end
			end
			v305 = v305 + 1
			v300[v305] = v331
			v306[v331] = (v306[v331] or 0) + 1
			v307 = v307 + 1
			v310[v307] = v333
			v309[v333] = (v309[v333] or 0) + 1
			if v332 > 0 then
				local v338 = v_u_29[v298]
				v304 = v304 + 1
				v301[v304] = v338
			end
			if v335 > 0 then
				v308 = v308 + 1
				v302[v308] = v334
			end
			for v339 = p276 + 1, p276 + v298 - (v281 and 2 or 1) do
				v296 = (v296 * 256 + (p274[v339 - p278 + 2] or 0)) % 16777216
				if v298 <= v286 then
					local v340 = p275[v296]
					if not v340 then
						v340 = {}
						p275[v296] = v340
					end
					v340[#v340 + 1] = v339
				end
			end
			p276 = p276 + v298 - (v281 and 1 or 0)
			v303 = false
		end
		v299 = v319
		v298 = v320
	end
end
local function v_u_360(p342, p343)
	-- upvalues: (copy) v_u_217, (copy) v_u_234, (copy) v_u_35
	local v344, v345, v346 = v_u_217(p342, 15, 285)
	local v347, v348, v349 = v_u_217(p343, 15, 29)
	local v350, v351, v352 = v_u_234(v344, v346, v347, v349)
	local v353, v354 = v_u_217(v352, 7, 18)
	local v355 = 0
	for v356 = 1, 19 do
		if (v353[v_u_35[v356]] or 0) ~= 0 then
			v355 = v356
		end
	end
	local v357 = v355 - 4
	local v358 = v346 + 1 - 257
	local v359 = v349 + 1 - 1
	return v358, v359 < 0 and 0 or v359, v357, v353, v354, v350, v351, v344, v345, v347, v348
end
local function v_u_375(p361, p362, p363, p364, p365, p366, p367)
	-- upvalues: (copy) v_u_38
	local v368 = 17 + (p363 + 4) * 3
	for v369 = 1, #p365 do
		local v370 = p365[v369]
		v368 = v368 + p364[v370]
		if v370 >= 16 then
			v368 = v368 + (v370 == 16 and 2 or (v370 == 17 and 3 or 7))
		end
	end
	local v371 = 0
	for v372 = 1, #p361 do
		local v373 = p361[v372]
		v368 = v368 + p366[v373]
		if v373 > 256 then
			v371 = v371 + 1
			if v373 > 264 and v373 < 285 then
				v368 = v368 + v_u_38[v373 - 256]
			end
			local v374 = p362[v371]
			v368 = v368 + p367[v374]
			if v374 > 3 then
				v368 = v368 + ((v374 - v374 % 2) / 2 - 1)
			end
		end
	end
	return v368
end
local function v_u_403(p376, p377, p378, p379, p380, p381, p382, p383, p384, p385, p386, p387, p388, p389, p390, p391, p392)
	-- upvalues: (copy) v_u_35, (copy) v_u_38
	p376(p377 and 1 or 0, 1)
	p376(2, 2)
	p376(p382, 5)
	p376(p383, 5)
	p376(p384, 4)
	for v393 = 1, p384 + 4 do
		p376(p385[v_u_35[v393]] or 0, 3)
	end
	local v394 = 1
	for v395 = 1, #p387 do
		local v396 = p387[v395]
		p376(p386[v396], p385[v396])
		if v396 >= 16 then
			p376(p388[v394], v396 == 16 and 2 or (v396 == 17 and 3 or 7))
			v394 = v394 + 1
		end
	end
	local v397 = 0
	local v398 = 0
	local v399 = 0
	for v400 = 1, #p378 do
		local v401 = p378[v400]
		p376(p390[v401], p389[v401])
		if v401 > 256 then
			v398 = v398 + 1
			if v401 > 264 and v401 < 285 then
				v397 = v397 + 1
				p376(p379[v397], v_u_38[v401 - 256])
			end
			local v402 = p380[v398]
			p376(p392[v402], p391[v402])
			if v402 > 3 then
				v399 = v399 + 1
				p376(p381[v399], (v402 - v402 % 2) / 2 - 1)
			end
		end
	end
end
local function v_u_411(p404, p405)
	-- upvalues: (ref) v_u_42, (copy) v_u_38
	local v406 = 3
	local v407 = 0
	for v408 = 1, #p404 do
		local v409 = p404[v408]
		v406 = v406 + v_u_42[v409]
		if v409 > 256 then
			v407 = v407 + 1
			if v409 > 264 and v409 < 285 then
				v406 = v406 + v_u_38[v409 - 256]
			end
			local v410 = p405[v407]
			v406 = v406 + 5
			if v410 > 3 then
				v406 = v406 + ((v410 - v410 % 2) / 2 - 1)
			end
		end
	end
	return v406
end
local function v_u_424(p412, p413, p414, p415, p416, p417)
	-- upvalues: (ref) v_u_36, (ref) v_u_42, (copy) v_u_38, (ref) v_u_40
	p412(p413 and 1 or 0, 1)
	p412(1, 2)
	local v418 = 0
	local v419 = 0
	local v420 = 0
	for v421 = 1, #p414 do
		local v422 = p414[v421]
		p412(v_u_36[v422], v_u_42[v422])
		if v422 > 256 then
			v418 = v418 + 1
			if v422 > 264 and v422 < 285 then
				v419 = v419 + 1
				p412(p415[v419], v_u_38[v422 - 256])
			end
			local v423 = p416[v418]
			p412(v_u_40[v423], 5)
			if v423 > 3 then
				v420 = v420 + 1
				p412(p417[v420], (v423 - v423 % 2) / 2 - 1)
			end
		end
	end
end
local function v_u_434(p425, p426, p427, p428, p429, p430, p431)
	-- upvalues: (copy) v_u_13, (copy) v_u_27
	v_u_13(p430 - p429 + 1 <= 65535)
	p425(p427 and 1 or 0, 1)
	p425(0, 2)
	local v432 = (8 - (p431 + 3) % 8) % 8
	if v432 > 0 then
		p425(v_u_27[v432] - 1, v432)
	end
	local v433 = p430 - p429 + 1
	p425(v433, 16)
	p425(255 - v433 % 256 + (255 - (v433 - v433 % 256) / 256) * 256, 16)
	p426(p428:sub(p429, p430))
end
local function v_u_488(p435, p436, p437, p438, p439, p440)
	-- upvalues: (copy) v_u_272, (copy) v_u_341, (copy) v_u_360, (copy) v_u_375, (copy) v_u_411, (copy) v_u_13, (copy) v_u_434, (copy) v_u_424, (copy) v_u_403, (copy) v_u_15
	local v441 = {}
	local v442 = {}
	local v443 = nil
	local v444 = nil
	local v445 = nil
	local v446 = p438(3)
	local v447 = #p439
	local v448 = nil
	local v449 = nil
	if p435 then
		if p435.level then
			v448 = p435.level
		end
		if p435.strategy then
			v449 = p435.strategy
		end
	end
	if not v448 then
		if v447 < 2048 then
			v448 = 7
		elseif v447 > 65536 then
			v448 = 3
		else
			v448 = 5
		end
	end
	while not v443 do
		local v450
		if v444 then
			v444 = v445 + 1
			v445 = v445 + 32768
			v450 = v444 - 32768 - 1
		else
			v444 = 1
			v450 = 0
			v445 = 65535
		end
		if v447 <= v445 then
			v445 = v447
			v443 = true
		else
			v443 = false
		end
		local v451, v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462, v463, v464, v465, v466, v467
		if v448 == 0 then
			v451 = nil
			v452 = nil
			v453 = nil
			v454 = nil
			v455 = nil
			v456 = nil
			v457 = nil
			v458 = nil
			v459 = nil
			v460 = nil
			v461 = nil
			v462 = nil
			v463 = nil
			v464 = nil
			v465 = nil
			v466 = nil
			v467 = nil
		else
			v_u_272(p439, v441, v444, v445 + 3, v450)
			if v444 == 1 and p440 then
				local v468 = p440.string_table
				local v469 = p440.strlen
				for v470 = 0, -v469 + 1 < -257 and -257 or -v469 + 1, -1 do
					v441[v470] = v468[v469 + v470]
				end
			end
			local v471, v472
			if v449 == "huffman_only" then
				v451 = {}
				v_u_272(p439, v451, v444, v445, v444 - 1)
				v451[v445 - v444 + 2] = 256
				v471 = {}
				v467 = {}
				for v473 = 1, v445 - v444 + 2 do
					local v474 = v451[v473]
					v471[v474] = (v471[v474] or 0) + 1
				end
				v472 = {}
				v461 = {}
				v460 = {}
			else
				v451, v467, v471, v460, v461, v472 = v_u_341(v448, v441, v442, v444, v445, v450, p440)
			end
			v452, v455, v463, v453, v454, v466, v458, v464, v456, v462, v457 = v_u_360(v471, v472)
			v465 = v_u_375(v451, v460, v463, v453, v466, v464, v462)
			v459 = v_u_411(v451, v460)
		end
		v_u_13(v445 - v444 + 1 <= 65535)
		local v475 = 3 + (8 - (v446 + 3) % 8) % 8 + 32 + (v445 - v444 + 1) * 8
		local v476
		if v459 and (v459 < v475 and v459) then
			v476 = v459
		else
			v476 = v475
		end
		if v465 and (v465 < v476 and v465) then
			v476 = v465
		end
		if v448 == 0 or v449 ~= "fixed" and (v449 ~= "dynamic" and v475 == v476) then
			v_u_434(p436, p437, v443, p439, v444, v445, v446)
			v446 = v446 + v475
		elseif v449 == "dynamic" or v449 ~= "fixed" and v459 ~= v476 then
			if v449 == "dynamic" or v465 == v476 then
				v_u_403(p436, v443, v451, v467, v460, v461, v452, v455, v463, v453, v454, v466, v458, v464, v456, v462, v457)
				v446 = v446 + v465
			end
		else
			v_u_424(p436, v443, v451, v467, v460, v461)
			v446 = v446 + v459
		end
		local v477
		if v443 then
			v477 = p438(3)
		else
			v477 = p438(0)
		end
		v_u_13(v477 == v446)
		if not v443 then
			if p440 and v444 == 1 then
				local v478 = 0
				while v441[v478] do
					v441[v478] = nil
					v478 = v478 - 1
				end
			end
			local v479 = 1
			p440 = nil
			for v480 = v445 - 32767, v445 do
				v441[v479] = v441[v480 - v450]
				v479 = v479 + 1
			end
			for v481, v482 in v_u_15(v442) do
				local v483 = #v482
				if v483 > 0 and v445 + 1 - v482[1] > 32768 then
					if v483 == 1 then
						v442[v481] = nil
					else
						local v484 = 0
						local v485 = {}
						for v486 = 2, v483 do
							local v487 = v482[v486]
							if v445 + 1 - v487 <= 32768 then
								v484 = v484 + 1
								v485[v484] = v487
							end
						end
						v442[v481] = v485
					end
				end
			end
		end
	end
end
local function v_u_497(p489, p490, p491)
	-- upvalues: (copy) v_u_144, (copy) v_u_488
	local v492, v493, v494 = v_u_144()
	v_u_488(p491, v492, v493, v494, p489, p490)
	local v495, v496 = v494(1)
	return v496, (8 - v495 % 8) % 8
end
local function v_u_520(p498, p499, p500)
	-- upvalues: (copy) v_u_144, (copy) v_u_488, (ref) v_u_25
	local v501, v502, v503 = v_u_144()
	v501(120, 8)
	local v504 = p499 and 1 or 0
	local v505 = 128 + v504 * 32
	v501(v505 + (31 - (30720 + v505) % 31), 8)
	if v504 == 1 then
		local v506 = p499.adler32
		local v507 = v506 % 256
		local v508 = (v506 - v507) / 256
		local v509 = v508 % 256
		local v510 = (v508 - v509) / 256
		local v511 = v510 % 256
		v501((v510 - v511) / 256 % 256, 8)
		v501(v511, 8)
		v501(v509, 8)
		v501(v507, 8)
	end
	v_u_488(p500, v501, v502, v503, p498, p499)
	v503(2)
	local v512 = v_u_25:Adler32(p498)
	local v513 = v512 % 256
	local v514 = (v512 - v513) / 256
	local v515 = v514 % 256
	local v516 = (v514 - v515) / 256
	local v517 = v516 % 256
	v501((v516 - v517) / 256 % 256, 8)
	v501(v517, 8)
	v501(v515, 8)
	v501(v513, 8)
	local v518, v519 = v503(1)
	return v519, (8 - v518 % 8) % 8
end
function v_u_25.CompressDeflate(_, p521, p522)
	-- upvalues: (copy) v_u_130, (copy) v_u_14, (copy) v_u_497
	local v523, v524 = v_u_130(p521, false, nil, true, p522)
	if not v523 then
		v_u_14("Usage: LibDeflate:CompressDeflate(str, configs): " .. v524, 2)
	end
	return v_u_497(p521, nil, p522)
end
function v_u_25.CompressDeflateWithDict(_, p525, p526, p527)
	-- upvalues: (copy) v_u_130, (copy) v_u_14, (copy) v_u_497
	local v528, v529 = v_u_130(p525, true, p526, true, p527)
	if not v528 then
		v_u_14("Usage: LibDeflate:CompressDeflateWithDict" .. "(str, dictionary, configs): " .. v529, 2)
	end
	return v_u_497(p525, p526, p527)
end
function v_u_25.CompressZlib(_, p530, p531)
	-- upvalues: (copy) v_u_130, (copy) v_u_14, (copy) v_u_520
	local v532, v533 = v_u_130(p530, false, nil, true, p531)
	if not v532 then
		v_u_14("Usage: LibDeflate:CompressZlib(str, configs): " .. v533, 2)
	end
	return v_u_520(p530, nil, p531)
end
function v_u_25.CompressZlibWithDict(_, p534, p535, p536)
	-- upvalues: (copy) v_u_130, (copy) v_u_14, (copy) v_u_520
	local v537, v538 = v_u_130(p534, true, p535, true, p536)
	if not v537 then
		v_u_14("Usage: LibDeflate:CompressZlibWithDict" .. "(str, dictionary, configs): " .. v538, 2)
	end
	return v_u_520(p534, p535, p536)
end
local function v_u_580(p_u_539)
	-- upvalues: (copy) v_u_27, (copy) v_u_16, (copy) v_u_13, (copy) v_u_17, (copy) v_u_20, (copy) v_u_28
	local v_u_540 = #p_u_539
	local v_u_541 = 1
	local v_u_542 = 0
	local v_u_543 = 0
	return function(p544)
		-- upvalues: (ref) v_u_27, (ref) v_u_542, (ref) v_u_543, (copy) p_u_539, (ref) v_u_541, (ref) v_u_16
		local v545 = v_u_27[p544]
		if p544 <= v_u_542 then
			local v546 = v_u_543 % v545
			v_u_543 = (v_u_543 - v546) / v545
			v_u_542 = v_u_542 - p544
			return v546
		end
		local v547 = v_u_27[v_u_542]
		local v548, v549, v550, v551 = v_u_16(p_u_539, v_u_541, v_u_541 + 3)
		v_u_543 = v_u_543 + ((v548 or 0) + (v549 or 0) * 256 + (v550 or 0) * 65536 + (v551 or 0) * 16777216) * v547
		v_u_541 = v_u_541 + 4
		v_u_542 = v_u_542 + 32 - p544
		local v552 = v_u_543 % v545
		v_u_543 = (v_u_543 - v552) / v545
		return v552
	end, function(p553, p554, p555)
		-- upvalues: (ref) v_u_542, (ref) v_u_13, (ref) v_u_543, (ref) v_u_17, (copy) v_u_540, (ref) v_u_541, (copy) p_u_539, (ref) v_u_20
		v_u_13(v_u_542 % 8 == 0)
		local v556
		if v_u_542 / 8 < p553 then
			v556 = v_u_542 / 8 or p553
		else
			v556 = p553
		end
		for _ = 1, v556 do
			local v557 = v_u_543 % 256
			p555 = p555 + 1
			p554[p555] = v_u_17(v557)
			v_u_543 = (v_u_543 - v557) / 256
		end
		v_u_542 = v_u_542 - v556 * 8
		local v558 = p553 - v556
		if (v_u_540 - v_u_541 - v558 + 1) * 8 + v_u_542 < 0 then
			return -1
		end
		for v559 = v_u_541, v_u_541 + v558 - 1 do
			p555 = p555 + 1
			p554[p555] = v_u_20(p_u_539, v559, v559)
		end
		v_u_541 = v_u_541 + v558
		return p555
	end, function(p560, p561, p562)
		-- upvalues: (ref) v_u_542, (copy) p_u_539, (ref) v_u_27, (ref) v_u_541, (ref) v_u_16, (ref) v_u_543, (ref) v_u_28
		local v563, v564, v565
		if p562 > 0 then
			if v_u_542 < 15 and p_u_539 then
				local v566 = v_u_27[v_u_542]
				local v567, v568, v569, v570 = v_u_16(p_u_539, v_u_541, v_u_541 + 3)
				v_u_543 = v_u_543 + ((v567 or 0) + (v568 or 0) * 256 + (v569 or 0) * 65536 + (v570 or 0) * 16777216) * v566
				v_u_541 = v_u_541 + 4
				v_u_542 = v_u_542 + 32
			end
			local v571 = v_u_27[p562]
			v_u_542 = v_u_542 - p562
			local v572 = v_u_543 % v571
			v_u_543 = (v_u_543 - v572) / v571
			local v573 = v_u_28[p562][v572]
			v563 = p560[p562]
			if v573 < v563 then
				return p561[v573]
			end
			v564 = v563 * 2
			v565 = v573 * 2
		else
			v565 = 0
			v564 = 0
			v563 = 0
		end
		for v574 = p562 + 1, 15 do
			local v575 = v_u_543 % 2
			v_u_543 = (v_u_543 - v575) / 2
			v_u_542 = v_u_542 - 1
			if v575 == 1 then
				v565 = v565 + 1 - v565 % 2 or v565
			end
			local v576 = p560[v574] or 0
			local v577 = v565 - v564
			if v577 < v576 then
				return p561[v563 + v577]
			end
			v563 = v563 + v576
			v564 = (v564 + v576) * 2
			v565 = v565 * 2
		end
		return -10
	end, function()
		-- upvalues: (copy) v_u_540, (ref) v_u_541, (ref) v_u_542
		return (v_u_540 - v_u_541 + 1) * 8 + v_u_542
	end, function()
		-- upvalues: (ref) v_u_542, (ref) v_u_27, (ref) v_u_543
		local v578 = v_u_542 % 8
		local v579 = v_u_27[v578]
		v_u_542 = v_u_542 - v578
		v_u_543 = (v_u_543 - v_u_543 % v579) / v579
	end
end
local function v_u_588(p581, p582)
	-- upvalues: (copy) v_u_580
	local v583, v584, v585, v586, v587 = v_u_580(p581)
	return {
		["ReadBits"] = v583,
		["ReadBytes"] = v584,
		["Decode"] = v585,
		["ReaderBitlenLeft"] = v586,
		["SkipToByteBoundary"] = v587,
		["buffer_size"] = 0,
		["buffer"] = {},
		["result_buffer"] = {},
		["dictionary"] = p582
	}
end
local function v_u_603(p589, p590, p591)
	local v592 = p591
	local v593 = {}
	for v594 = 0, p590 do
		local v595 = p589[v594] or 0
		if v595 > 0 and (v595 < p591 and v595) then
			p591 = v595
		end
		v593[v595] = (v593[v595] or 0) + 1
	end
	if v593[0] == p590 + 1 then
		return 0, v593, {}, 0
	end
	local v596 = 1
	for v597 = 1, v592 do
		v596 = v596 * 2 - (v593[v597] or 0)
		if v596 < 0 then
			return v596
		end
	end
	local v598 = { 0 }
	for v599 = 1, v592 - 1 do
		v598[v599 + 1] = v598[v599] + (v593[v599] or 0)
	end
	local v600 = {}
	for v601 = 0, p590 do
		local v602 = p589[v601] or 0
		if v602 ~= 0 then
			v600[v598[v602]] = v601
			v598[v602] = v598[v602] + 1
		end
	end
	return v596, v593, v600, p591
end
local function v_u_629(p604, p605, p606, p607, p608, p609, p610)
	-- upvalues: (copy) v_u_26, (copy) v_u_41, (copy) v_u_38, (copy) v_u_43, (copy) v_u_44, (copy) v_u_21
	local v611 = p604.buffer
	local v612 = p604.buffer_size
	local v613 = p604.ReadBits
	local v614 = p604.Decode
	local v615 = p604.ReaderBitlenLeft
	local v616 = p604.result_buffer
	local v617 = p604.dictionary
	local v618, v619, v620
	if v617 and not v611[0] then
		v618 = v617.string_table
		v619 = v617.strlen
		v620 = -v619 + 1
		for v621 = 0, -v619 + 1 < -257 and -257 or -v619 + 1, -1 do
			v611[v621] = v_u_26[v618[v619 + v621]]
		end
	else
		v619 = nil
		v618 = nil
		v620 = 1
	end
	while true do
		local v622 = v614(p605, p606, p607)
		if v622 < 0 or v622 > 285 then
			break
		end
		if v622 < 256 then
			v612 = v612 + 1
			v611[v612] = v_u_26[v622]
		elseif v622 > 256 then
			local v623 = v622 - 256
			local v624 = v_u_41[v623]
			if v623 >= 8 then
				v624 = v624 + v613(v_u_38[v623]) or v624
			end
			v622 = v614(p608, p609, p610)
			if v622 < 0 or v622 > 29 then
				return -10
			end
			local v625 = v_u_43[v622]
			if v625 > 4 then
				v625 = v625 + v613(v_u_44[v622]) or v625
			end
			local v626 = v612 - v625 + 1
			if v626 < v620 then
				return -11
			end
			if v626 >= -257 then
				for _ = 1, v624 do
					v612 = v612 + 1
					v611[v612] = v611[v626]
					v626 = v626 + 1
				end
			else
				local v627 = v619 + v626
				for _ = 1, v624 do
					v612 = v612 + 1
					v611[v612] = v_u_26[v618[v627]]
					v627 = v627 + 1
				end
			end
		end
		if v615() < 0 then
			return 2
		end
		if v612 >= 65536 then
			v616[#v616 + 1] = v_u_21(v611, "", 1, 32768)
			for v628 = 32769, v612 do
				v611[v628 - 32768] = v611[v628]
			end
			v612 = v612 - 32768
			v611[v612 + 1] = nil
		end
		if v622 == 256 then
			p604.buffer_size = v612
			return 0
		end
	end
	return -10
end
local function v_u_642(p630)
	-- upvalues: (copy) v_u_21
	local v631 = p630.buffer
	local v632 = p630.buffer_size
	local v633 = p630.ReadBits
	local v634 = p630.ReadBytes
	local v635 = p630.ReaderBitlenLeft
	local v636 = p630.SkipToByteBoundary
	local v637 = p630.result_buffer
	v636()
	local v638 = v633(16)
	if v635() < 0 then
		return 2
	end
	local v639 = v633(16)
	if v635() < 0 then
		return 2
	end
	if v638 % 256 + v639 % 256 ~= 255 then
		return -2
	end
	if (v638 - v638 % 256) / 256 + (v639 - v639 % 256) / 256 ~= 255 then
		return -2
	end
	local v640 = v634(v638, v631, v632)
	if v640 < 0 then
		return 2
	end
	if v640 >= 65536 then
		v637[#v637 + 1] = v_u_21(v631, "", 1, 32768)
		for v641 = 32769, v640 do
			v631[v641 - 32768] = v631[v641]
		end
		v640 = v640 - 32768
		v631[v640 + 1] = nil
	end
	p630.buffer_size = v640
	return 0
end
local function v_u_669(p643)
	-- upvalues: (copy) v_u_35, (copy) v_u_603, (copy) v_u_629
	local v644 = p643.ReadBits
	local v645 = p643.Decode
	local v646 = v644(5) + 257
	local v647 = v644(5) + 1
	local v648 = v644(4) + 4
	if v646 > 286 or v647 > 30 then
		return -3
	end
	local v649 = {}
	for v650 = 1, v648 do
		v649[v_u_35[v650]] = v644(3)
	end
	local v651, v652, v653, v654 = v_u_603(v649, 18, 7)
	if v651 ~= 0 then
		return -4
	end
	local v655 = 0
	local v656 = {}
	local v657 = {}
	while v655 < v646 + v647 do
		local v658 = v645(v652, v653, v654)
		if v658 < 0 then
			return v658
		end
		if v658 < 16 then
			if v655 < v646 then
				v656[v655] = v658
			else
				v657[v655 - v646] = v658
			end
			v655 = v655 + 1
		else
			local v659 = 0
			local v660
			if v658 == 16 then
				if v655 == 0 then
					return -5
				end
				if v655 - 1 < v646 then
					v659 = v656[v655 - 1]
				else
					v659 = v657[v655 - v646 - 1]
				end
				v660 = 3 + v644(2)
			elseif v658 == 17 then
				v660 = 3 + v644(3)
			else
				v660 = 11 + v644(7)
			end
			if v655 + v660 > v646 + v647 then
				return -6
			end
			while v660 > 0 do
				v660 = v660 - 1
				if v655 < v646 then
					v656[v655] = v659
				else
					v657[v655 - v646] = v659
				end
				v655 = v655 + 1
			end
		end
	end
	if (v656[256] or 0) == 0 then
		return -9
	end
	local v661, v662, v663, v664 = v_u_603(v656, v646 - 1, 15)
	if v661 ~= 0 and (v661 < 0 or v646 ~= (v662[0] or 0) + (v662[1] or 0)) then
		return -7
	end
	local v665, v666, v667, v668 = v_u_603(v657, v647 - 1, 15)
	return v665 ~= 0 and (v665 < 0 or v647 ~= (v666[0] or 0) + (v666[1] or 0)) and -8 or v_u_629(p643, v662, v663, v664, v666, v667, v668)
end
local function v_u_675(p670)
	-- upvalues: (copy) v_u_642, (copy) v_u_629, (ref) v_u_37, (ref) v_u_45, (ref) v_u_39, (ref) v_u_46, (copy) v_u_669, (copy) v_u_21
	local v671 = p670.ReadBits
	local v672 = nil
	while not v672 do
		v672 = v671(1) == 1
		local v673 = v671(2)
		local v674
		if v673 == 0 then
			v674 = v_u_642(p670)
		elseif v673 == 1 then
			v674 = v_u_629(p670, v_u_37, v_u_45, 7, v_u_39, v_u_46, 5)
		else
			if v673 ~= 2 then
				return nil, -1
			end
			v674 = v_u_669(p670)
		end
		if v674 ~= 0 then
			return nil, v674
		end
	end
	p670.result_buffer[#p670.result_buffer + 1] = v_u_21(p670.buffer, "", 1, p670.buffer_size)
	return v_u_21(p670.result_buffer)
end
local function v_u_682(p676, p677)
	-- upvalues: (copy) v_u_588, (copy) v_u_675
	local v678 = v_u_588(p676, p677)
	local v679, v680 = v_u_675(v678)
	if not v679 then
		return nil, v680
	end
	local v681 = v678.ReaderBitlenLeft()
	return v679, (v681 - v681 % 8) / 8
end
local function v_u_707(p683, p684)
	-- upvalues: (copy) v_u_588, (copy) v_u_675, (ref) v_u_25
	local v685 = v_u_588(p683, p684)
	local v686 = v685.ReadBits
	local v687 = v686(8)
	if v685.ReaderBitlenLeft() < 0 then
		return nil, 2
	end
	local v688 = v687 % 16
	local v689 = (v687 - v688) / 16
	if v688 ~= 8 then
		return nil, -12
	end
	if v689 > 7 then
		return nil, -13
	end
	local v690 = v686(8)
	if v685.ReaderBitlenLeft() < 0 then
		return nil, 2
	end
	if (v687 * 256 + v690) % 31 ~= 0 then
		return nil, -14
	end
	local v691 = (v690 - v690 % 32) / 32 % 2
	local _ = (v690 - v690 % 64) / 64 % 4
	if v691 == 1 then
		if not p684 then
			return nil, -16
		end
		local v692 = v686(8)
		local v693 = v686(8)
		local v694 = v686(8)
		local v695 = v686(8)
		local v696 = v692 * 16777216 + v693 * 65536 + v694 * 256 + v695
		if v685.ReaderBitlenLeft() < 0 then
			return nil, 2
		end
		local v697 = p684.adler32
		if v696 % 4294967296 ~= v697 % 4294967296 then
			return nil, -17
		end
	end
	local v698, v699 = v_u_675(v685)
	if not v698 then
		return nil, v699
	end
	v685.SkipToByteBoundary()
	local v700 = v686(8)
	local v701 = v686(8)
	local v702 = v686(8)
	local v703 = v686(8)
	if v685.ReaderBitlenLeft() < 0 then
		return nil, 2
	end
	local v704 = v700 * 16777216 + v701 * 65536 + v702 * 256 + v703
	local v705 = v_u_25:Adler32(v698)
	if v704 % 4294967296 ~= v705 % 4294967296 then
		return nil, -15
	end
	local v706 = v685.ReaderBitlenLeft()
	return v698, (v706 - v706 % 8) / 8
end
function v_u_25.DecompressDeflate(_, p708)
	-- upvalues: (copy) v_u_24, (copy) v_u_14, (copy) v_u_682
	local v709, v710
	if v_u_24(p708) == "string" then
		v709 = true
		v710 = ""
	else
		v710 = ("\'str\' - string expected got \'%s\'."):format((v_u_24(p708)))
		v709 = false
	end
	if not v709 then
		v_u_14("Usage: LibDeflate:DecompressDeflate(str): " .. v710, 2)
	end
	return v_u_682(p708)
end
function v_u_25.DecompressDeflateWithDict(_, p711, p712)
	-- upvalues: (copy) v_u_24, (copy) v_u_118, (copy) v_u_14, (copy) v_u_682
	local v713, v714
	if v_u_24(p711) == "string" then
		local v715
		v715, v713 = v_u_118(p712)
		if v715 then
			v714 = true
			v713 = ""
		else
			v714 = false
		end
	else
		v713 = ("\'str\' - string expected got \'%s\'."):format((v_u_24(p711)))
		v714 = false
	end
	if not v714 then
		v_u_14("Usage: LibDeflate:DecompressDeflateWithDict(str, dictionary): " .. v713, 2)
	end
	return v_u_682(p711, p712)
end
function v_u_25.DecompressZlib(_, p716)
	-- upvalues: (copy) v_u_24, (copy) v_u_14, (copy) v_u_707
	local v717, v718
	if v_u_24(p716) == "string" then
		v717 = true
		v718 = ""
	else
		v718 = ("\'str\' - string expected got \'%s\'."):format((v_u_24(p716)))
		v717 = false
	end
	if not v717 then
		v_u_14("Usage: LibDeflate:DecompressZlib(str): " .. v718, 2)
	end
	return v_u_707(p716)
end
function v_u_25.DecompressZlibWithDict(_, p719, p720)
	-- upvalues: (copy) v_u_24, (copy) v_u_118, (copy) v_u_14, (copy) v_u_707
	local v721, v722
	if v_u_24(p719) == "string" then
		local v723
		v723, v721 = v_u_118(p720)
		if v723 then
			v722 = true
			v721 = ""
		else
			v722 = false
		end
	else
		v721 = ("\'str\' - string expected got \'%s\'."):format((v_u_24(p719)))
		v722 = false
	end
	if not v722 then
		v_u_14("Usage: LibDeflate:DecompressZlibWithDict(str, dictionary): " .. v721, 2)
	end
	return v_u_707(p719, p720)
end
local v724 = {}
local v725 = v724
for v726 = 0, 143 do
	v725[v726] = 8
end
for v727 = 144, 255 do
	v725[v727] = 9
end
v725[256] = 7
v725[257] = 7
v725[258] = 7
v725[259] = 7
v725[260] = 7
v725[261] = 7
v725[262] = 7
v725[263] = 7
v725[264] = 7
v725[265] = 7
v725[266] = 7
v725[267] = 7
v725[268] = 7
v725[269] = 7
v725[270] = 7
v725[271] = 7
v725[272] = 7
v725[273] = 7
v725[274] = 7
v725[275] = 7
v725[276] = 7
v725[277] = 7
v725[278] = 7
v725[279] = 7
v725[280] = 8
v725[281] = 8
v725[282] = 8
v725[283] = 8
v725[284] = 8
v725[285] = 8
v725[286] = 8
v725[287] = 8
local v728 = {}
for v729 = 0, 31 do
	v728[v729] = 5
end
local v730, v731, v732 = v_u_603(v725, 287, 9)
local v733 = v731
local _ = v732
v_u_13(v730 == 0)
local v734, v735, v736 = v_u_603(v728, 31, 5)
local v737 = v735
local _ = v736
v_u_13(v734 == 0)
local _ = v_u_181(v733, v725, 287, 9)
local _ = v_u_181(v737, v728, 31, 5)
local v_u_738 = {
	["\0"] = "%z",
	["("] = "%(",
	[")"] = "%)",
	["."] = "%.",
	["%"] = "%%",
	["+"] = "%+",
	["-"] = "%-",
	["*"] = "%*",
	["?"] = "%?",
	["["] = "%[",
	["]"] = "%]",
	["^"] = "%^",
	["$"] = "%$"
}
function v_u_25.CreateCodec(_, p739, p740, p741)
	-- upvalues: (copy) v_u_24, (copy) v_u_14, (copy) v_u_16, (copy) v_u_20, (copy) v_u_21, (copy) v_u_738, (copy) v_u_26, (copy) v_u_19, (copy) v_u_18
	if v_u_24(p739) ~= "string" or (v_u_24(p740) ~= "string" or v_u_24(p741) ~= "string") then
		v_u_14("Usage: LibDeflate:CreateCodec(reserved_chars, escape_chars, map_chars): All arguments must be string.", 2)
	end
	if p740 == "" then
		return nil, "No escape characters supplied."
	end
	if #p739 < #p741 then
		return nil, "The number of reserved characters must be at least as many as the number of mapped chars."
	end
	if p739 == "" then
		return nil, "No characters to encode."
	end
	local v742 = p739 .. p740 .. p741
	local v743 = {}
	for v744 = 1, #v742 do
		local v745 = v_u_16(v742, v744, v744)
		if v743[v745] then
			return nil, "There must be no duplicate characters in the concatenation of reserved_chars, escape_chars and map_chars."
		end
		v743[v745] = true
	end
	local v_u_746 = {}
	local v_u_747 = {}
	local v748 = {}
	local v_u_749 = {}
	if #p741 > 0 then
		local v750 = {}
		local v751 = {}
		for v752 = 1, #p741 do
			local v753 = v_u_20(p739, v752, v752)
			local v754 = v_u_20(p741, v752, v752)
			v_u_749[v753] = v754
			v748[#v748 + 1] = v753
			v750[v754] = v753
			v751[#v751 + 1] = v754
		end
		v_u_746[#v_u_746 + 1] = "([" .. v_u_21(v751):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_738) .. "])"
		v_u_747[#v_u_747 + 1] = v750
	end
	local v755 = 1
	local v756 = v_u_20(p740, v755, v755)
	local v757 = 0
	local v758 = {}
	local v759 = {}
	for v760 = 1, #v742 do
		local v761 = v_u_20(v742, v760, v760)
		if not v_u_749[v761] then
			while v757 >= 256 or v743[v757] do
				v757 = v757 + 1
				if v757 > 255 then
					v_u_746[#v_u_746 + 1] = v756:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_738) .. "([" .. v_u_21(v758):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_738) .. "])"
					v_u_747[#v_u_747 + 1] = v759
					v755 = v755 + 1
					v756 = v_u_20(p740, v755, v755)
					if not v756 or v756 == "" then
						return nil, "Out of escape characters."
					end
					v757 = 0
					v758 = {}
					v759 = {}
				end
			end
			local v762 = v_u_26[v757]
			v_u_749[v761] = v756 .. v762
			v748[#v748 + 1] = v761
			v759[v762] = v761
			v758[#v758 + 1] = v762
			v757 = v757 + 1
		end
		if v760 == #v742 then
			v_u_746[#v_u_746 + 1] = v756:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_738) .. "([" .. v_u_21(v758):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_738) .. "])"
			v_u_747[#v_u_747 + 1] = v759
		end
	end
	local v763 = {}
	local v_u_764 = "([" .. v_u_21(v748):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_738) .. "])"
	function v763.Encode(_, p765)
		-- upvalues: (ref) v_u_24, (ref) v_u_14, (ref) v_u_19, (copy) v_u_764, (copy) v_u_749
		if v_u_24(p765) ~= "string" then
			v_u_14(("Usage: codec:Encode(str): \'str\' - string expected got \'%s\'."):format((v_u_24(p765))), 2)
		end
		return v_u_19(p765, v_u_764, v_u_749)
	end
	local v_u_766 = #v_u_746
	local v_u_767 = "([" .. p739:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v_u_738) .. "])"
	function v763.Decode(_, p768)
		-- upvalues: (ref) v_u_24, (ref) v_u_14, (ref) v_u_18, (copy) v_u_767, (copy) v_u_766, (ref) v_u_19, (copy) v_u_746, (copy) v_u_747
		if v_u_24(p768) ~= "string" then
			v_u_14(("Usage: codec:Decode(str): \'str\' - string expected got \'%s\'."):format((v_u_24(p768))), 2)
		end
		if v_u_18(p768, v_u_767) then
			return nil
		end
		for v769 = 1, v_u_766 do
			p768 = v_u_19(p768, v_u_746[v769], v_u_747[v769])
		end
		return p768
	end
	return v763
end
local v_u_770 = nil
local v_u_771 = {
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
	"(",
	")"
}
local v_u_772 = {
	[97] = 0,
	[98] = 1,
	[99] = 2,
	[100] = 3,
	[101] = 4,
	[102] = 5,
	[103] = 6,
	[104] = 7,
	[105] = 8,
	[106] = 9,
	[107] = 10,
	[108] = 11,
	[109] = 12,
	[110] = 13,
	[111] = 14,
	[112] = 15,
	[113] = 16,
	[114] = 17,
	[115] = 18,
	[116] = 19,
	[117] = 20,
	[118] = 21,
	[119] = 22,
	[120] = 23,
	[121] = 24,
	[122] = 25,
	[65] = 26,
	[66] = 27,
	[67] = 28,
	[68] = 29,
	[69] = 30,
	[70] = 31,
	[71] = 32,
	[72] = 33,
	[73] = 34,
	[74] = 35,
	[75] = 36,
	[76] = 37,
	[77] = 38,
	[78] = 39,
	[79] = 40,
	[80] = 41,
	[81] = 42,
	[82] = 43,
	[83] = 44,
	[84] = 45,
	[85] = 46,
	[86] = 47,
	[87] = 48,
	[88] = 49,
	[89] = 50,
	[90] = 51,
	[48] = 52,
	[49] = 53,
	[50] = 54,
	[51] = 55,
	[52] = 56,
	[53] = 57,
	[54] = 58,
	[55] = 59,
	[56] = 60,
	[57] = 61,
	[40] = 62,
	[41] = 63
}
function v_u_25.EncodeForPrint(_, p773)
	-- upvalues: (copy) v_u_24, (copy) v_u_14, (copy) v_u_16, (copy) v_u_771, (copy) v_u_27, (copy) v_u_21
	if v_u_24(p773) ~= "string" then
		v_u_14(("Usage: LibDeflate:EncodeForPrint(str): \'str\' - string expected got \'%s\'."):format((v_u_24(p773))), 2)
	end
	local v774 = #p773
	local v775 = v774 - 2
	local v776 = 1
	local v777 = 0
	local v778 = {}
	while v776 <= v775 do
		local v779, v780, v781 = v_u_16(p773, v776, v776 + 2)
		v776 = v776 + 3
		local v782 = v779 + v780 * 256 + v781 * 65536
		local v783 = v782 % 64
		local v784 = (v782 - v783) / 64
		local v785 = v784 % 64
		local v786 = (v784 - v785) / 64
		local v787 = v786 % 64
		local v788 = (v786 - v787) / 64
		v777 = v777 + 1
		v778[v777] = v_u_771[v783] .. v_u_771[v785] .. v_u_771[v787] .. v_u_771[v788]
	end
	local v789 = 0
	local v790 = 0
	while v776 <= v774 do
		v790 = v790 + v_u_16(p773, v776, v776) * v_u_27[v789]
		v789 = v789 + 8
		v776 = v776 + 1
	end
	while v789 > 0 do
		local v791 = v790 % 64
		v777 = v777 + 1
		v778[v777] = v_u_771[v791]
		v790 = (v790 - v791) / 64
		v789 = v789 - 6
	end
	return v_u_21(v778)
end
function v_u_25.DecodeForPrint(_, p792)
	-- upvalues: (copy) v_u_24, (copy) v_u_14, (copy) v_u_16, (copy) v_u_772, (copy) v_u_26, (copy) v_u_27, (copy) v_u_21
	if v_u_24(p792) ~= "string" then
		v_u_14(("Usage: LibDeflate:DecodeForPrint(str): \'str\' - string expected got \'%s\'."):format((v_u_24(p792))), 2)
	end
	local v793 = p792:gsub("^[%c ]+", ""):gsub("[%c ]+$", "")
	local v794 = #v793
	if v794 == 1 then
		return nil
	end
	local v795 = v794 - 3
	local v796 = 1
	local v797 = 0
	local v798 = {}
	while v796 <= v795 do
		local v799, v800, v801, v802 = v_u_16(v793, v796, v796 + 3)
		local v803 = v_u_772[v799]
		local v804 = v_u_772[v800]
		local v805 = v_u_772[v801]
		local v806 = v_u_772[v802]
		if not (v803 and (v804 and (v805 and v806))) then
			return nil
		end
		v796 = v796 + 4
		local v807 = v803 + v804 * 64 + v805 * 4096 + v806 * 262144
		local v808 = v807 % 256
		local v809 = (v807 - v808) / 256
		local v810 = v809 % 256
		local v811 = (v809 - v810) / 256
		v797 = v797 + 1
		v798[v797] = v_u_26[v808] .. v_u_26[v810] .. v_u_26[v811]
	end
	local v812 = 0
	local v813 = 0
	while v796 <= v794 do
		local v814 = v_u_772[v_u_16(v793, v796, v796)]
		if not v814 then
			return nil
		end
		v813 = v813 + v814 * v_u_27[v812]
		v812 = v812 + 6
		v796 = v796 + 1
	end
	while v812 >= 8 do
		local v815 = v813 % 256
		v797 = v797 + 1
		v798[v797] = v_u_26[v815]
		v813 = (v813 - v815) / 256
		v812 = v812 - 8
	end
	return v_u_21(v798)
end
v_u_25.internals = {
	["LoadStringToTable"] = v_u_272,
	["IsValidDictionary"] = v_u_118,
	["IsEqualAdler32"] = v90,
	["_byte_to_6bit_char"] = v_u_771,
	["_6bit_to_byte"] = v_u_772,
	["InternalClearCache"] = function()
		-- upvalues: (ref) v_u_770
		v_u_770 = nil
	end
}
return v1
