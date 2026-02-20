--!native
local v0 = {};
local v1 = {};
v0.Deflate = {};
v0.Zlib = {};
v0.Library = v1;
local function v4(v2, v3) --[[ Line: 199 ]] --[[ Name: Compress ]]
    -- upvalues: v1 (ref)
    return v1:CompressDeflate(v2, v3);
end;
v0.Deflate.Compress = v4;
v4 = function(v5) --[[ Line: 220 ]] --[[ Name: Decompress ]]
    -- upvalues: v1 (ref)
    return v1:DecompressDeflate(v5);
end;
v0.Deflate.Decompress = v4;
v4 = function(v6, v7) --[[ Line: 244 ]] --[[ Name: Compress ]]
    -- upvalues: v1 (ref)
    return v1:CompressZlib(v6, v7);
end;
v0.Zlib.Compress = v4;
v4 = function(v8) --[[ Line: 265 ]] --[[ Name: Decompress ]]
    -- upvalues: v1 (ref)
    return v1:DecompressZlib(v8);
end;
v0.Zlib.Decompress = v4;
v1 = {
    _VERSION = "1.0.2-release", 
    _MAJOR = "LibDeflate", 
    _MINOR = 3, 
    _COPYRIGHT = "LibDeflate 1.0.2-release Copyright (C) 2018-2020 Haoqian He. Licensed under the zlib License"
};
v4 = assert;
local l_error_0 = error;
local l_pairs_0 = pairs;
local l_byte_0 = string.byte;
local l_char_0 = string.char;
local l_find_0 = string.find;
local l_gsub_0 = string.gsub;
local l_sub_0 = string.sub;
local l_concat_0 = table.concat;
local l_sort_0 = table.sort;
local l_tostring_0 = tostring;
local l_type_0 = type;
local v20 = {};
local v21 = {};
local v22 = {};
local v23 = {};
local v24 = {};
local v25 = {};
local v26 = {};
local v27 = {};
local v28 = {};
local v29 = {
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
};
local v30 = {
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
};
local v31 = {
    [0] = 1; 
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
};
local v32 = {
    [0] = 0; 
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
};
local v33 = {
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
};
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
for v42 = 0, 255 do
    v21[v42] = l_char_0(v42);
end;
local v43 = 1;
for v44 = 0, 32 do
    v20[v44] = v43;
    v43 = v43 * 2;
end;
for v45 = 1, 9 do
    v22[v45] = {};
    for v46 = 0, v20[v45 + 1] - 1 do
        local v47 = 0;
        local l_v46_0 = v46;
        for _ = 1, v45 do
            v47 = v47 - v47 % 2 + ((not (v47 % 2 ~= 1) or l_v46_0 % 2 == 1) and 1 or 0);
            l_v46_0 = (l_v46_0 - l_v46_0 % 2) / 2;
            v47 = v47 * 2;
        end;
        v22[v45][v46] = (v47 - v47 % 2) / 2;
    end;
end;
v43 = 18;
local v50 = 16;
local v51 = 265;
local v52 = 1;
for v53 = 3, 258 do
    if v53 <= 10 then
        v23[v53] = v53 + 254;
        v25[v53] = 0;
    elseif v53 == 258 then
        v23[v53] = 285;
        v25[v53] = 0;
    else
        if v43 < v53 then
            v43 = v43 + v50;
            v50 = v50 * 2;
            v51 = v51 + 4;
            v52 = v52 + 1;
        end;
        local v54 = v53 - v43 - 1 + v50 / 2;
        v23[v53] = (v54 - v54 % (v50 / 8)) / (v50 / 8) + v51;
        v25[v53] = v52;
        v24[v53] = v54 % (v50 / 8);
    end;
end;
v26[1] = 0;
v26[2] = 1;
v28[1] = 0;
v28[2] = 0;
v43 = 3;
v50 = 4;
v51 = 2;
v52 = 0;
for v55 = 3, 256 do
    if v50 < v55 then
        v43 = v43 * 2;
        v50 = v50 * 2;
        v51 = v51 + 2;
        v52 = v52 + 1;
    end;
    v26[v55] = v55 <= v43 and v51 or v51 + 1;
    v28[v55] = v52 < 0 and 0 or v52;
    if v50 >= 8 then
        v27[v55] = (v55 - v50 / 2 - 1) % (v50 / 4);
    end;
end;
v1.Adler32 = function(_, v57) --[[ Line: 530 ]] --[[ Name: Adler32 ]]
    -- upvalues: l_type_0 (copy), l_error_0 (copy), l_byte_0 (copy)
    if l_type_0(v57) ~= "string" then
        l_error_0(("Usage: LibDeflate:Adler32(str): 'str' - string expected got '%s'."):format((l_type_0(v57))), 2);
    end;
    local v58 = #v57;
    local v59 = 1;
    local v60 = 1;
    local v61 = 0;
    while v59 <= v58 - 15 do
        local v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77 = l_byte_0(v57, v59, v59 + 15);
        v61 = (v61 + v60 * 16 + v62 * 16 + 15 * v63 + 14 * v64 + 13 * v65 + 12 * v66 + 11 * v67 + 10 * v68 + 9 * v69 + 8 * v70 + 7 * v71 + 6 * v72 + 5 * v73 + 4 * v74 + 3 * v75 + 2 * v76 + v77) % 65521;
        v60 = (v60 + v62 + v63 + v64 + v65 + v66 + v67 + v68 + v69 + v70 + v71 + v72 + v73 + v74 + v75 + v76 + v77) % 65521;
        v59 = v59 + 16;
    end;
    while v59 <= v58 do
        v60 = (v60 + l_byte_0(v57, v59, v59)) % 65521;
        v61 = (v61 + v60) % 65521;
        v59 = v59 + 1;
    end;
    return (v61 * 65536 + v60) % 4294967296;
end;
v43 = function(v78, v79) --[[ Line: 572 ]] --[[ Name: IsEqualAdler32 ]]
    return v78 % 4294967296 == v79 % 4294967296;
end;
v1.CreateDictionary = function(v80, v81, v82, v83) --[[ Line: 618 ]] --[[ Name: CreateDictionary ]]
    -- upvalues: l_type_0 (copy), l_error_0 (copy), l_byte_0 (copy)
    if l_type_0(v81) ~= "string" then
        l_error_0(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'str' - string expected got '%s'."):format((l_type_0(v81))), 2);
    end;
    if l_type_0(v82) ~= "number" then
        l_error_0(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'strlen' - number expected got '%s'."):format((l_type_0(v82))), 2);
    end;
    if l_type_0(v83) ~= "number" then
        l_error_0(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'adler32' - number expected got '%s'."):format((l_type_0(v83))), 2);
    end;
    if v82 ~= #v81 then
        l_error_0(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'strlen' does not match the actual length of 'str'. 'strlen': %u, '#str': %u . Please check if 'str' is modified unintentionally."):format(v82, #v81));
    end;
    if v82 == 0 then
        l_error_0("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'str' - Empty string is not allowed.", 2);
    end;
    if v82 > 32768 then
        l_error_0(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'str' - string longer than 32768 bytes is not allowed. Got %d bytes."):format(v82), 2);
    end;
    local v84 = v80:Adler32(v81);
    if not (v83 % 4294967296 == v84 % 4294967296) then
        l_error_0(("Usage: LibDeflate:CreateDictionary(str, strlen, adler32): 'adler32' does not match the actual adler32 of 'str'. 'adler32': %u, 'Adler32(str)': %u . Please check if 'str' is modified unintentionally."):format(v83, v84));
    end;
    local v85 = {
        adler32 = v83, 
        hash_tables = {}, 
        string_table = {}, 
        strlen = v82
    };
    local l_string_table_0 = v85.string_table;
    local l_hash_tables_0 = v85.hash_tables;
    l_string_table_0[1] = l_byte_0(v81, 1, 1);
    l_string_table_0[2] = l_byte_0(v81, 2, 2);
    if v82 >= 3 then
        local v88 = 1;
        local v89 = l_string_table_0[1] * 256 + l_string_table_0[2];
        while v88 <= v82 - 2 - 3 do
            local v90, v91, v92, v93 = l_byte_0(v81, v88 + 2, v88 + 5);
            l_string_table_0[v88 + 2] = v90;
            l_string_table_0[v88 + 3] = v91;
            l_string_table_0[v88 + 4] = v92;
            l_string_table_0[v88 + 5] = v93;
            v89 = (v89 * 256 + v90) % 16777216;
            local v94 = l_hash_tables_0[v89];
            if not v94 then
                v94 = {};
                l_hash_tables_0[v89] = v94;
            end;
            v94[#v94 + 1] = v88 - v82;
            v88 = v88 + 1;
            v89 = (v89 * 256 + v91) % 16777216;
            v94 = l_hash_tables_0[v89];
            if not v94 then
                v94 = {};
                l_hash_tables_0[v89] = v94;
            end;
            v94[#v94 + 1] = v88 - v82;
            v88 = v88 + 1;
            v89 = (v89 * 256 + v92) % 16777216;
            v94 = l_hash_tables_0[v89];
            if not v94 then
                v94 = {};
                l_hash_tables_0[v89] = v94;
            end;
            v94[#v94 + 1] = v88 - v82;
            v88 = v88 + 1;
            v89 = (v89 * 256 + v93) % 16777216;
            v94 = l_hash_tables_0[v89];
            if not v94 then
                v94 = {};
                l_hash_tables_0[v89] = v94;
            end;
            v94[#v94 + 1] = v88 - v82;
            v88 = v88 + 1;
        end;
        while v88 <= v82 - 2 do
            local v95 = l_byte_0(v81, v88 + 2);
            l_string_table_0[v88 + 2] = v95;
            v89 = (v89 * 256 + v95) % 16777216;
            local v96 = l_hash_tables_0[v89];
            if not v96 then
                v96 = {};
                l_hash_tables_0[v89] = v96;
            end;
            v96[#v96 + 1] = v88 - v82;
            v88 = v88 + 1;
        end;
    end;
    return v85;
end;
v50 = function(v97) --[[ Line: 714 ]] --[[ Name: IsValidDictionary ]]
    -- upvalues: l_type_0 (copy)
    if l_type_0(v97) ~= "table" then
        return false, ("'dictionary' - table expected got '%s'."):format((l_type_0(v97)));
    elseif l_type_0(v97.adler32) ~= "number" or l_type_0(v97.string_table) ~= "table" or l_type_0(v97.strlen) ~= "number" or v97.strlen <= 0 or v97.strlen > 32768 or v97.strlen ~= #v97.string_table or l_type_0(v97.hash_tables) ~= "table" then
        return false, ("'dictionary' - corrupted dictionary."):format((l_type_0(v97)));
    else
        return true, "";
    end;
end;
v51 = {
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
};
v52 = function(v98, v99, v100, v101, v102) --[[ Line: 791 ]] --[[ Name: IsValidArguments ]]
    -- upvalues: l_type_0 (copy), v50 (copy), l_pairs_0 (copy), v51 (copy), l_tostring_0 (copy)
    if l_type_0(v98) ~= "string" then
        return false, ("'str' - string expected got '%s'."):format((l_type_0(v98)));
    else
        if v99 then
            local v103, v104 = v50(v100);
            if not v103 then
                return false, v104;
            end;
        end;
        if v101 then
            local v105 = l_type_0(v102);
            if v105 ~= "nil" and v105 ~= "table" then
                return false, ("'configs' - nil or table expected got '%s'."):format((l_type_0(v102)));
            elseif v105 == "table" then
                for v106, v107 in l_pairs_0(v102) do
                    if v106 ~= "level" and v106 ~= "strategy" then
                        return false, ("'configs' - unsupported table key in the configs: '%s'."):format(v106);
                    elseif v106 == "level" and not v51[v107] then
                        return false, ("'configs' - unsupported 'level': %s."):format((l_tostring_0(v107)));
                    elseif v106 == "strategy" and v107 ~= "fixed" and v107 ~= "huffman_only" and v107 ~= "dynamic" then
                        return false, ("'configs' - unsupported 'strategy': '%s'."):format((l_tostring_0(v107)));
                    end;
                end;
            end;
        end;
        return true, "";
    end;
end;
local function v123() --[[ Line: 855 ]] --[[ Name: CreateWriter ]]
    -- upvalues: v20 (copy), v21 (copy), l_char_0 (copy), l_concat_0 (copy)
    local v108 = 0;
    local v109 = 0;
    local v110 = 0;
    local v111 = 0;
    local v112 = {};
    local v113 = {};
    return function(v114, v115) --[[ Line: 868 ]] --[[ Name: WriteBits ]]
        -- upvalues: v109 (ref), v20 (ref), v110 (ref), v111 (ref), v108 (ref), v112 (ref), v21 (ref)
        v109 = v109 + v114 * v20[v110];
        v110 = v110 + v115;
        v111 = v111 + v115;
        if v110 >= 32 then
            v108 = v108 + 1;
            v112[v108] = v21[v109 % 256] .. v21[(v109 - v109 % 256) / 256 % 256] .. v21[(v109 - v109 % 65536) / 65536 % 256] .. v21[(v109 - v109 % 16777216) / 16777216 % 256];
            local v116 = v20[32 - v110 + v115];
            v109 = (v114 - v114 % v116) / v116;
            v110 = v110 - 32;
        end;
    end, function(v117) --[[ Line: 889 ]] --[[ Name: WriteString ]]
        -- upvalues: v110 (ref), v108 (ref), v112 (ref), v109 (ref), l_char_0 (ref), v111 (ref)
        for _ = 1, v110, 8 do
            v108 = v108 + 1;
            v112[v108] = l_char_0(v109 % 256);
            v109 = (v109 - v109 % 256) / 256;
        end;
        v110 = 0;
        v108 = v108 + 1;
        v112[v108] = v117;
        v111 = v111 + #v117 * 8;
    end, function(v119) --[[ Line: 908 ]] --[[ Name: FlushWriter ]]
        -- upvalues: v111 (ref), v110 (ref), v109 (ref), v20 (ref), v108 (ref), v112 (ref), v21 (ref), l_concat_0 (ref), v113 (copy)
        if v119 == 3 then
            return v111;
        else
            if v119 == 1 or v119 == 2 then
                local v120 = (8 - v110 % 8) % 8;
                if v110 > 0 then
                    v109 = v109 - v20[v110] + v20[v110 + v120];
                    for _ = 1, v110, 8 do
                        v108 = v108 + 1;
                        v112[v108] = v21[v109 % 256];
                        v109 = (v109 - v109 % 256) / 256;
                    end;
                    v109 = 0;
                    v110 = 0;
                end;
                if v119 == 2 then
                    v111 = v111 + v120;
                    return v111;
                end;
            end;
            local v122 = l_concat_0(v112);
            v112 = {};
            v108 = 0;
            v113[#v113 + 1] = v122;
            if v119 == 0 then
                return v111;
            else
                return v111, l_concat_0(v113);
            end;
        end;
    end;
end;
local function v131(v124, v125, v126) --[[ Line: 963 ]] --[[ Name: MinHeapPush ]]
    v126 = v126 + 1;
    v124[v126] = v125;
    local v127 = v125[1];
    local l_v126_0 = v126;
    local v129 = (l_v126_0 - l_v126_0 % 2) / 2;
    while v129 >= 1 and v127 < v124[v129][1] do
        local v130 = v124[v129];
        v124[v129] = v125;
        v124[l_v126_0] = v130;
        l_v126_0 = v129;
        v129 = (v129 - v129 % 2) / 2;
    end;
end;
local function v142(v132, v133) --[[ Line: 984 ]] --[[ Name: MinHeapPop ]]
    local v134 = v132[1];
    local v135 = v132[v133];
    local v136 = v135[1];
    v132[1] = v135;
    v132[v133] = v134;
    v133 = v133 - 1;
    local v137 = 1;
    local v138 = v137 * 2;
    local v139 = v138 + 1;
    while v138 <= v133 do
        local v140 = v132[v138];
        if v139 <= v133 and v132[v139][1] < v140[1] then
            local v141 = v132[v139];
            if v141[1] < v136 then
                v132[v139] = v135;
                v132[v137] = v141;
                v137 = v139;
                v138 = v137 * 2;
                v139 = v138 + 1;
            else
                break;
            end;
        elseif v140[1] < v136 then
            v132[v138] = v135;
            v132[v137] = v140;
            v137 = v138;
            v138 = v137 * 2;
            v139 = v138 + 1;
        else
            break;
        end;
    end;
    return v134;
end;
local function v155(v143, v144, v145, v146) --[[ Line: 1034 ]] --[[ Name: GetHuffmanCodeFromBitlen ]]
    -- upvalues: v22 (copy)
    local v147 = 0;
    local v148 = {};
    local v149 = {};
    for v150 = 1, v146 do
        v147 = (v147 + (v143[v150 - 1] or 0)) * 2;
        v148[v150] = v147;
    end;
    for v151 = 0, v145 do
        local v152 = v144[v151];
        if v152 then
            v147 = v148[v152];
            v148[v152] = v147 + 1;
            if v152 <= 9 then
                v149[v151] = v22[v152][v147];
            else
                local v153 = 0;
                for _ = 1, v152 do
                    v153 = v153 - v153 % 2 + ((not (v153 % 2 ~= 1) or v147 % 2 == 1) and 1 or 0);
                    v147 = (v147 - v147 % 2) / 2;
                    v153 = v153 * 2;
                end;
                v149[v151] = (v153 - v153 % 2) / 2;
            end;
        end;
    end;
    return v149;
end;
local function v159(v156, v157) --[[ Line: 1075 ]] --[[ Name: SortByFirstThenSecond ]]
    local v158 = true;
    if v156[1] >= v157[1] then
        v158 = false;
        if v156[1] == v157[1] then
            v158 = v156[2] < v157[2];
        end;
    end;
    return v158;
end;
local function v190(v160, v161, v162) --[[ Line: 1091 ]] --[[ Name: GetHuffmanBitlenAndCode ]]
    -- upvalues: l_pairs_0 (copy), l_sort_0 (copy), v159 (copy), v142 (copy), v131 (copy), v155 (copy)
    local v163 = nil;
    local v164 = -1;
    local v165 = {};
    local v166 = {};
    local v167 = {};
    local v168 = {};
    local v169 = {};
    local v170 = 0;
    for v171, v172 in l_pairs_0(v160) do
        v170 = v170 + 1;
        v165[v170] = {
            v172, 
            v171
        };
    end;
    if v170 == 0 then
        return {}, {}, -1;
    elseif v170 == 1 then
        local v173 = v165[1][2];
        v167[v173] = 1;
        v168[v173] = 0;
        return v167, v168, v173;
    else
        l_sort_0(v165, v159);
        v163 = v170;
        for v174 = 1, v163 do
            v166[v174] = v165[v174];
        end;
        while v163 > 1 do
            local v175 = v142(v166, v163);
            v163 = v163 - 1;
            local v176 = v142(v166, v163);
            v163 = v163 - 1;
            local v177 = {
                v175[1] + v176[1], 
                -1, 
                v175, 
                v176
            };
            v131(v166, v177, v163);
            v163 = v163 + 1;
        end;
        local v178 = 0;
        local v179 = {
            v166[1], 
            0, 
            0, 
            0
        };
        local v180 = 1;
        local v181 = 1;
        v166[1][1] = 0;
        while v181 <= v180 do
            local v182 = v179[v181];
            local v183 = v182[1];
            local v184 = v182[2];
            local v185 = v182[3];
            local v186 = v182[4];
            if v185 then
                v180 = v180 + 1;
                v179[v180] = v185;
                v185[1] = v183 + 1;
            end;
            if v186 then
                v180 = v180 + 1;
                v179[v180] = v186;
                v186[1] = v183 + 1;
            end;
            v181 = v181 + 1;
            if v161 < v183 then
                v178 = v178 + 1;
                v183 = v161;
            end;
            if v184 >= 0 then
                v167[v184] = v183;
                v164 = v164 < v184 and v184 or v164;
                v169[v183] = (v169[v183] or 0) + 1;
            end;
        end;
        if v178 > 0 then
            repeat
                local v187 = v161 - 1;
                while (v169[v187] or 0) == 0 do
                    v187 = v187 - 1;
                end;
                v169[v187] = v169[v187] - 1;
                v169[v187 + 1] = (v169[v187 + 1] or 0) + 2;
                v169[v161] = v169[v161] - 1;
                v178 = v178 - 2;
            until v178 <= 0;
            v181 = 1;
            for v188 = v161, 1, -1 do
                local v189 = v169[v188] or 0;
                while v189 > 0 do
                    v167[v165[v181][2]] = v188;
                    v189 = v189 - 1;
                    v181 = v181 + 1;
                end;
            end;
        end;
        return v167, v155(v169, v167, v162, v161), v164;
    end;
end;
local function v206(v191, v192, v193, v194) --[[ Line: 1228 ]] --[[ Name: RunLengthEncodeHuffmanBitlen ]]
    local v195 = 0;
    local v196 = {};
    local v197 = {};
    local v198 = 0;
    local v199 = {};
    local v200 = nil;
    local v201 = 0;
    local v202 = v192 + (v194 < 0 and 0 or v194) + 1;
    for v203 = 0, v202 + 1 do
        local v204 = if v203 <= v192 then v191[v203] or 0 else if v203 <= v202 then v193[v203 - v192 - 1] or 0 else nil;
        if v204 == v200 then
            v201 = v201 + 1;
            if v204 ~= 0 and v201 == 6 then
                v195 = v195 + 1;
                v196[v195] = 16;
                v198 = v198 + 1;
                v199[v198] = 3;
                v197[16] = (v197[16] or 0) + 1;
                v201 = 0;
            elseif v204 == 0 and v201 == 138 then
                v195 = v195 + 1;
                v196[v195] = 18;
                v198 = v198 + 1;
                v199[v198] = 127;
                v197[18] = (v197[18] or 0) + 1;
                v201 = 0;
            end;
        else
            if v201 == 1 then
                v195 = v195 + 1;
                v196[v195] = v200;
                v197[v200] = (v197[v200] or 0) + 1;
            elseif v201 == 2 then
                v195 = v195 + 1;
                v196[v195] = v200;
                v195 = v195 + 1;
                v196[v195] = v200;
                v197[v200] = (v197[v200] or 0) + 2;
            elseif v201 >= 3 then
                v195 = v195 + 1;
                local v205 = v200 ~= 0 and 16 or v201 <= 10 and 17 or 18;
                v196[v195] = v205;
                v197[v205] = (v197[v205] or 0) + 1;
                v198 = v198 + 1;
                v199[v198] = v201 <= 10 and v201 - 3 or v201 - 11;
            end;
            v200 = v204;
            if v204 and v204 ~= 0 then
                v195 = v195 + 1;
                v196[v195] = v204;
                v197[v204] = (v197[v204] or 0) + 1;
                v201 = 0;
            else
                v201 = 1;
            end;
        end;
    end;
    return v196, v199, v197;
end;
local function v244(v207, v208, v209, v210, v211) --[[ Line: 1314 ]] --[[ Name: LoadStringToTable ]]
    -- upvalues: l_byte_0 (copy)
    local v212 = v209 - v211;
    while v212 <= v210 - 15 - v211 do
        local v213 = v212 + 1;
        local v214 = v212 + 2;
        local v215 = v212 + 3;
        local v216 = v212 + 4;
        local v217 = v212 + 5;
        local v218 = v212 + 6;
        local v219 = v212 + 7;
        local v220 = v212 + 8;
        local v221 = v212 + 9;
        local v222 = v212 + 10;
        local v223 = v212 + 11;
        local v224 = v212 + 12;
        local v225 = v212 + 13;
        local v226 = v212 + 14;
        local v227 = v212 + 15;
        local v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243 = l_byte_0(v207, v212 + v211, v212 + 15 + v211);
        v208[v212] = v228;
        v208[v213] = v229;
        v208[v214] = v230;
        v208[v215] = v231;
        v208[v216] = v232;
        v208[v217] = v233;
        v208[v218] = v234;
        v208[v219] = v235;
        v208[v220] = v236;
        v208[v221] = v237;
        v208[v222] = v238;
        v208[v223] = v239;
        v208[v224] = v240;
        v208[v225] = v241;
        v208[v226] = v242;
        v208[v227] = v243;
        v212 = v212 + 16;
    end;
    while v212 <= v210 - v211 do
        v208[v212] = l_byte_0(v207, v212 + v211, v212 + v211);
        v212 = v212 + 1;
    end;
    return v208;
end;
local function v311(v245, v246, v247, v248, v249, v250, v251) --[[ Line: 1371 ]] --[[ Name: GetBlockLZ77Result ]]
    -- upvalues: v51 (copy), v4 (copy), v23 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v24 (copy)
    local v252 = v51[v245];
    local v253 = v252[1];
    local v254 = v252[2];
    local v255 = v252[3];
    local v256 = v252[4];
    local v257 = v252[5];
    local v258 = not v253 and v255 or 2147483646;
    local v259 = v257 - v257 % 4 / 4;
    local v260 = nil;
    local v261 = nil;
    local v262 = nil;
    local v263 = 0;
    if v251 then
        v261 = v251.hash_tables;
        v262 = v251.string_table;
        v263 = v251.strlen;
        v4(v248 == 1);
        if v248 <= v249 and v263 >= 2 then
            v260 = v262[v263 - 1] * 65536 + v262[v263] * 256 + v246[1];
            local v264 = v247[v260];
            if not v264 then
                v264 = {};
                v247[v260] = v264;
            end;
            v264[#v264 + 1] = -1;
        end;
        if v248 + 1 <= v249 and v263 >= 1 then
            v260 = v262[v263] * 65536 + v246[1] * 256 + v246[2];
            local v265 = v247[v260];
            if not v265 then
                v265 = {};
                v247[v260] = v265;
            end;
            v265[#v265 + 1] = 0;
        end;
    end;
    local v266 = v263 + 3;
    v260 = (v246[v248 - v250] or 0) * 256 + (v246[v248 + 1 - v250] or 0);
    local v267 = {};
    local v268 = 0;
    local v269 = {};
    local v270 = {};
    local v271 = 0;
    local v272 = {};
    local v273 = {};
    local v274 = 0;
    local v275 = {};
    local v276 = 0;
    local v277 = false;
    local v278 = nil;
    local v279 = nil;
    local v280 = 0;
    local v281 = 0;
    local l_v248_0 = v248;
    local v283 = v249 + (v253 and 1 or 0);
    while l_v248_0 <= v283 do
        local v284 = l_v248_0 - v250;
        local v285 = v250 - 3;
        v278 = v280;
        v279 = v281;
        v280 = 0;
        v260 = (v260 * 256 + (v246[v284 + 2] or 0)) % 16777216;
        local v286 = nil;
        local v287 = nil;
        local v288 = v247[v260];
        local v289 = nil;
        if not v288 then
            v289 = 0;
            v288 = {};
            v247[v260] = v288;
            if v261 then
                v287 = v261[v260];
                v286 = v287 and #v287 or 0;
            else
                v286 = 0;
            end;
        else
            v289 = #v288;
            v287 = v288;
            v286 = v289;
        end;
        if l_v248_0 <= v249 then
            v288[v289 + 1] = l_v248_0;
        end;
        if v286 > 0 and l_v248_0 + 2 <= v249 and (not v253 or v278 < v255) then
            local v290 = v253 and v254 <= v278 and v259 or v257;
            local v291 = v249 - l_v248_0;
            v291 = (v291 >= 257 and 257 or v291) + v284;
            local v292 = v284 + 3;
            while v286 >= 1 and v290 > 0 do
                local v293 = v287[v286];
                if l_v248_0 - v293 <= 32768 then
                    if v293 < l_v248_0 then
                        local l_v292_0 = v292;
                        if v293 >= -257 then
                            local v295 = v293 - v285;
                            while l_v292_0 <= v291 and v246[v295] == v246[l_v292_0] do
                                l_v292_0 = l_v292_0 + 1;
                                v295 = v295 + 1;
                            end;
                        else
                            local v296 = v266 + v293;
                            while l_v292_0 <= v291 and v262[v296] == v246[l_v292_0] do
                                l_v292_0 = l_v292_0 + 1;
                                v296 = v296 + 1;
                            end;
                        end;
                        local v297 = l_v292_0 - v284;
                        if v280 < v297 then
                            v280 = v297;
                            v281 = l_v248_0 - v293;
                        end;
                        if v256 <= v280 then
                            break;
                        end;
                    end;
                    v286 = v286 - 1;
                    v290 = v290 - 1;
                    if v286 == 0 and v293 > 0 and v261 then
                        v287 = v261[v260];
                        v286 = v287 and #v287 or 0;
                    end;
                else
                    break;
                end;
            end;
        end;
        if not v253 then
            v278 = v280;
            v279 = v281;
        end;
        if (not v253 or v277) and (v278 > 3 or v278 == 3 and v279 < 4096) and v280 <= v278 then
            local v298 = v23[v278];
            local v299 = v25[v278];
            local v300 = nil;
            local v301 = nil;
            local v302 = nil;
            if v279 <= 256 then
                v300 = v26[v279];
                v302 = v27[v279];
                v301 = v28[v279];
            else
                v300 = 16;
                v301 = 7;
                local v303 = 384;
                local v304 = 512;
                while true do
                    if v279 <= v303 then
                        v302 = (v279 - v304 / 2 - 1) % (v304 / 4);
                        break;
                    elseif v279 <= v304 then
                        v302 = (v279 - v304 / 2 - 1) % (v304 / 4);
                        v300 = v300 + 1;
                        break;
                    else
                        v300 = v300 + 2;
                        v301 = v301 + 1;
                        v303 = v303 * 2;
                        v304 = v304 * 2;
                    end;
                end;
            end;
            v268 = v268 + 1;
            v267[v268] = v298;
            v269[v298] = (v269[v298] or 0) + 1;
            v271 = v271 + 1;
            v270[v271] = v300;
            v272[v300] = (v272[v300] or 0) + 1;
            if v299 > 0 then
                local v305 = v24[v278];
                v274 = v274 + 1;
                v273[v274] = v305;
            end;
            if v301 > 0 then
                v276 = v276 + 1;
                v275[v276] = v302;
            end;
            local v306 = l_v248_0 + 1;
            local v307 = l_v248_0 + v278;
            local v308 = v253 and 2 or 1;
            for v309 = v306, v307 - v308 do
                v260 = (v260 * 256 + (v246[v309 - v250 + 2] or 0)) % 16777216;
                if v278 <= v258 then
                    v288 = v247[v260];
                    if not v288 then
                        v288 = {};
                        v247[v260] = v288;
                    end;
                    v288[#v288 + 1] = v309;
                end;
            end;
            l_v248_0 = l_v248_0 + v278 - (v253 and 1 or 0);
            v277 = false;
        elseif not v253 or v277 then
            local v310 = v246[v253 and v284 - 1 or v284];
            v268 = v268 + 1;
            v267[v268] = v310;
            v269[v310] = (v269[v310] or 0) + 1;
            l_v248_0 = l_v248_0 + 1;
        else
            v277 = true;
            l_v248_0 = l_v248_0 + 1;
        end;
    end;
    v267[v268 + 1] = 256;
    v269[256] = (v269[256] or 0) + 1;
    return v267, v273, v269, v270, v275, v272;
end;
local function v329(v312, v313) --[[ Line: 1628 ]] --[[ Name: GetBlockDynamicHuffmanHeader ]]
    -- upvalues: v190 (copy), v206 (copy), v33 (copy)
    local v314, v315, v316 = v190(v312, 15, 285);
    local v317, v318, v319 = v190(v313, 15, 29);
    local v320, v321, v322 = v206(v314, v316, v317, v319);
    local v323, v324 = v190(v322, 7, 18);
    local v325 = 0;
    for v326 = 1, 19 do
        if (v323[v33[v326]] or 0) ~= 0 then
            v325 = v326;
        end;
    end;
    v325 = v325 - 4;
    local v327 = v316 + 1 - 257;
    local v328 = v319 + 1 - 1;
    if v328 < 0 then
        v328 = 0;
    end;
    return v327, v328, v325, v323, v324, v320, v321, v314, v315, v317, v318;
end;
local function v344(v330, v331, v332, v333, v334, v335, v336) --[[ Line: 1667 ]] --[[ Name: GetDynamicHuffmanBlockSize ]]
    -- upvalues: v30 (copy)
    local v337 = 17 + (v332 + 4) * 3;
    for v338 = 1, #v334 do
        local v339 = v334[v338];
        v337 = v337 + v333[v339];
        if v339 >= 16 then
            v337 = v337 + (v339 == 16 and 2 or v339 == 17 and 3 or 7);
        end;
    end;
    local v340 = 0;
    for v341 = 1, #v330 do
        local v342 = v330[v341];
        v337 = v337 + v335[v342];
        if v342 > 256 then
            v340 = v340 + 1;
            if v342 > 264 and v342 < 285 then
                v337 = v337 + v30[v342 - 256];
            end;
            local v343 = v331[v340];
            v337 = v337 + v336[v343];
            if v343 > 3 then
                v337 = v337 + ((v343 - v343 % 2) / 2 - 1);
            end;
        end;
    end;
    return v337;
end;
local function v372(v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361) --[[ Line: 1710 ]] --[[ Name: CompressDynamicHuffmanBlock ]]
    -- upvalues: v33 (copy), v30 (copy)
    v345(v346 and 1 or 0, 1);
    v345(2, 2);
    v345(v351, 5);
    v345(v352, 5);
    v345(v353, 4);
    for v362 = 1, v353 + 4 do
        v345(v354[v33[v362]] or 0, 3);
    end;
    local v363 = 1;
    for v364 = 1, #v356 do
        local v365 = v356[v364];
        v345(v355[v365], v354[v365]);
        if v365 >= 16 then
            v345(v357[v363], v365 == 16 and 2 or v365 == 17 and 3 or 7);
            v363 = v363 + 1;
        end;
    end;
    local v366 = 0;
    local v367 = 0;
    local v368 = 0;
    for v369 = 1, #v347 do
        local v370 = v347[v369];
        v345(v359[v370], v358[v370]);
        if v370 > 256 then
            v366 = v366 + 1;
            if v370 > 264 and v370 < 285 then
                v367 = v367 + 1;
                v345(v348[v367], v30[v370 - 256]);
            end;
            local v371 = v349[v366];
            v345(v361[v371], v360[v371]);
            if v371 > 3 then
                v368 = v368 + 1;
                v345(v350[v368], (v371 - v371 % 2) / 2 - 1);
            end;
        end;
    end;
end;
local function v380(v373, v374) --[[ Line: 1783 ]] --[[ Name: GetFixedHuffmanBlockSize ]]
    -- upvalues: v36 (ref), v30 (copy)
    local v375 = 3;
    local v376 = 0;
    for v377 = 1, #v373 do
        local v378 = v373[v377];
        v375 = v375 + v36[v378];
        if v378 > 256 then
            v376 = v376 + 1;
            if v378 > 264 and v378 < 285 then
                v375 = v375 + v30[v378 - 256];
            end;
            local v379 = v374[v376];
            v375 = v375 + 5;
            if v379 > 3 then
                v375 = v375 + ((v379 - v379 % 2) / 2 - 1);
            end;
        end;
    end;
    return v375;
end;
local function v393(v381, v382, v383, v384, v385, v386) --[[ Line: 1813 ]] --[[ Name: CompressFixedHuffmanBlock ]]
    -- upvalues: v34 (ref), v36 (ref), v30 (copy), v38 (ref)
    v381(v382 and 1 or 0, 1);
    v381(1, 2);
    local v387 = 0;
    local v388 = 0;
    local v389 = 0;
    for v390 = 1, #v383 do
        local v391 = v383[v390];
        v381(v34[v391], v36[v391]);
        if v391 > 256 then
            v387 = v387 + 1;
            if v391 > 264 and v391 < 285 then
                v388 = v388 + 1;
                v381(v384[v388], v30[v391 - 256]);
            end;
            local v392 = v385[v387];
            v381(v38[v392], 5);
            if v392 > 3 then
                v389 = v389 + 1;
                v381(v386[v389], (v392 - v392 % 2) / 2 - 1);
            end;
        end;
    end;
end;
local function _(v394, v395, v396) --[[ Line: 1856 ]] --[[ Name: GetStoreBlockSize ]]
    -- upvalues: v4 (copy)
    v4(v395 - v394 + 1 <= 65535);
    return 3 + (8 - (v396 + 3) % 8) % 8 + 32 + (v395 - v394 + 1) * 8;
end;
local function v407(v398, v399, v400, v401, v402, v403, v404) --[[ Line: 1870 ]] --[[ Name: CompressStoreBlock ]]
    -- upvalues: v4 (copy), v20 (copy)
    v4(v403 - v402 + 1 <= 65535);
    v398(v400 and 1 or 0, 1);
    v398(0, 2);
    local v405 = (8 - (v404 + 3) % 8) % 8;
    if v405 > 0 then
        v398(v20[v405] - 1, v405);
    end;
    local v406 = v403 - v402 + 1;
    v398(v406, 16);
    v398(255 - v406 % 256 + (255 - (v406 - v406 % 256) / 256) * 256, 16);
    v399(v401:sub(v402, v403));
end;
local function v479(v408, v409, v410, v411, v412, v413) --[[ Line: 1901 ]] --[[ Name: Deflate ]]
    -- upvalues: v244 (copy), v311 (copy), v329 (copy), v344 (copy), v380 (copy), v4 (copy), v407 (copy), v393 (copy), v372 (copy), l_pairs_0 (copy)
    local v414 = {};
    local v415 = {};
    local v416 = nil;
    local v417 = nil;
    local v418 = nil;
    local _ = nil;
    local v420 = v411(3);
    local v421 = #v412;
    local v422 = nil;
    local v423 = nil;
    local v424 = nil;
    if v408 then
        if v408.level then
            v423 = v408.level;
        end;
        if v408.strategy then
            v424 = v408.strategy;
        end;
    end;
    if not v423 then
        v423 = v421 < 2048 and 7 or v421 > 65536 and 3 or 5;
    end;
    while not v416 do
        if not v417 then
            v417 = 1;
            v418 = 65535;
            v422 = 0;
        else
            v417 = v418 + 1;
            v418 = v418 + 32768;
            v422 = v417 - 32768 - 1;
        end;
        if v421 <= v418 then
            v418 = v421;
            v416 = true;
        else
            v416 = false;
        end;
        local v425 = nil;
        local v426 = nil;
        local v427 = nil;
        local v428 = nil;
        local v429 = nil;
        local v430 = nil;
        local v431 = nil;
        local v432 = nil;
        local v433 = nil;
        local v434 = nil;
        local v435 = nil;
        local v436 = nil;
        local v437 = nil;
        local v438 = nil;
        local v439 = nil;
        local v440 = nil;
        local v441 = nil;
        local v442 = nil;
        local v443 = nil;
        local v444 = nil;
        if v423 ~= 0 then
            v244(v412, v414, v417, v418 + 3, v422);
            if v417 == 1 and v413 then
                local l_string_table_1 = v413.string_table;
                local l_strlen_0 = v413.strlen;
                local v447 = 0;
                local v448 = -l_strlen_0 + 1 < -257 and -257 or -l_strlen_0 + 1;
                for v449 = v447, v448, -1 do
                    v414[v449] = l_string_table_1[l_strlen_0 + v449];
                end;
            end;
            if v424 == "huffman_only" then
                v425 = {};
                v244(v412, v425, v417, v418, v417 - 1);
                v426 = {};
                v427 = {};
                v425[v418 - v417 + 2] = 256;
                for v450 = 1, v418 - v417 + 2 do
                    local v451 = v425[v450];
                    v427[v451] = (v427[v451] or 0) + 1;
                end;
                v428 = {};
                v429 = {};
                v430 = {};
            else
                local v452, v453, v454, v455, v456, v457 = v311(v423, v414, v415, v417, v418, v422, v413);
                v425 = v452;
                v426 = v453;
                v427 = v454;
                v428 = v455;
                v429 = v456;
                v430 = v457;
            end;
            local v458, v459, v460, v461, v462, v463, v464, v465, v466, v467, v468 = v329(v427, v430);
            v431 = v458;
            v432 = v459;
            v433 = v460;
            v434 = v461;
            v435 = v462;
            v436 = v463;
            v437 = v464;
            v438 = v465;
            v439 = v466;
            v440 = v467;
            v441 = v468;
            v442 = v344(v425, v428, v433, v434, v436, v438, v440);
            v443 = v380(v425, v428);
        end;
        local l_v417_0 = v417;
        local l_v418_0 = v418;
        local l_v420_0 = v420;
        v4(l_v418_0 - l_v417_0 + 1 <= 65535);
        v444 = 3 + (8 - (l_v420_0 + 3) % 8) % 8 + 32 + (l_v418_0 - l_v417_0 + 1) * 8;
        l_v417_0 = v444;
        l_v417_0 = v443 and v443 < l_v417_0 and v443 or l_v417_0;
        l_v417_0 = v442 and v442 < l_v417_0 and v442 or l_v417_0;
        if v423 == 0 or v424 ~= "fixed" and v424 ~= "dynamic" and v444 == l_v417_0 then
            v407(v409, v410, v416, v412, v417, v418, v420);
            v420 = v420 + v444;
        elseif v424 ~= "dynamic" and (v424 == "fixed" or v443 == l_v417_0) then
            v393(v409, v416, v425, v426, v428, v429);
            v420 = v420 + v443;
        elseif v424 == "dynamic" or v442 == l_v417_0 then
            v372(v409, v416, v425, v426, v428, v429, v431, v432, v433, v434, v435, v436, v437, v438, v439, v440, v441);
            v420 = v420 + v442;
        end;
        v4((if v416 then v411(3) else v411(0)) == v420);
        if not v416 then
            l_v418_0 = nil;
            if v413 and v417 == 1 then
                l_v418_0 = 0;
                while v414[l_v418_0] do
                    v414[l_v418_0] = nil;
                    l_v418_0 = l_v418_0 - 1;
                end;
            end;
            v413 = nil;
            l_v418_0 = 1;
            for v472 = v418 - 32767, v418 do
                v414[l_v418_0] = v414[v472 - v422];
                l_v418_0 = l_v418_0 + 1;
            end;
            for v473, v474 in l_pairs_0(v415) do
                local v475 = #v474;
                if v475 > 0 and v418 + 1 - v474[1] > 32768 then
                    if v475 == 1 then
                        v415[v473] = nil;
                    else
                        local v476 = {};
                        local v477 = 0;
                        for v478 = 2, v475 do
                            l_v418_0 = v474[v478];
                            if v418 + 1 - l_v418_0 <= 32768 then
                                v477 = v477 + 1;
                                v476[v477] = l_v418_0;
                            end;
                        end;
                        v415[v473] = v476;
                    end;
                end;
            end;
        end;
    end;
end;
local function v488(v480, v481, v482) --[[ Line: 2106 ]] --[[ Name: CompressDeflateInternal ]]
    -- upvalues: v123 (copy), v479 (copy)
    local v483, v484, v485 = v123();
    v479(v482, v483, v484, v485, v480, v481);
    local v486, v487 = v485(1);
    return v487, (8 - v486 % 8) % 8;
end;
local function v507(v489, v490, v491) --[[ Line: 2116 ]] --[[ Name: CompressZlibInternal ]]
    -- upvalues: v123 (copy), v479 (copy), v1 (ref)
    local v492, v493, v494 = v123();
    v492(120, 8);
    local v495 = v490 and 1 or 0;
    local v496 = 128 + v495 * 32;
    v492(v496 + (31 - (30720 + v496) % 31), 8);
    if v495 == 1 then
        local l_adler32_0 = v490.adler32;
        local v498 = l_adler32_0 % 256;
        l_adler32_0 = (l_adler32_0 - v498) / 256;
        local v499 = l_adler32_0 % 256;
        l_adler32_0 = (l_adler32_0 - v499) / 256;
        local v500 = l_adler32_0 % 256;
        v492((l_adler32_0 - v500) / 256 % 256, 8);
        v492(v500, 8);
        v492(v499, 8);
        v492(v498, 8);
    end;
    v479(v491, v492, v493, v494, v489, v490);
    v494(2);
    local v501 = v1:Adler32(v489);
    local v502 = v501 % 256;
    v501 = (v501 - v502) / 256;
    local v503 = v501 % 256;
    v501 = (v501 - v503) / 256;
    local v504 = v501 % 256;
    v492((v501 - v504) / 256 % 256, 8);
    v492(v504, 8);
    v492(v503, 8);
    v492(v502, 8);
    local v505, v506 = v494(1);
    return v506, (8 - v505 % 8) % 8;
end;
v1.CompressDeflate = function(_, v509, v510) --[[ Line: 2185 ]] --[[ Name: CompressDeflate ]]
    -- upvalues: v52 (copy), l_error_0 (copy), v488 (copy)
    local v511, v512 = v52(v509, false, nil, true, v510);
    if not v511 then
        l_error_0("Usage: LibDeflate:CompressDeflate(str, configs): " .. v512, 2);
    end;
    return v488(v509, nil, v510);
end;
v1.CompressDeflateWithDict = function(_, v514, v515, v516) --[[ Line: 2210 ]] --[[ Name: CompressDeflateWithDict ]]
    -- upvalues: v52 (copy), l_error_0 (copy), v488 (copy)
    local v517, v518 = v52(v514, true, v515, true, v516);
    if not v517 then
        l_error_0("Usage: LibDeflate:CompressDeflateWithDict" .. "(str, dictionary, configs): " .. v518, 2);
    end;
    return v488(v514, v515, v516);
end;
v1.CompressZlib = function(_, v520, v521) --[[ Line: 2231 ]] --[[ Name: CompressZlib ]]
    -- upvalues: v52 (copy), l_error_0 (copy), v507 (copy)
    local v522, v523 = v52(v520, false, nil, true, v521);
    if not v522 then
        l_error_0("Usage: LibDeflate:CompressZlib(str, configs): " .. v523, 2);
    end;
    return v507(v520, nil, v521);
end;
v1.CompressZlibWithDict = function(_, v525, v526, v527) --[[ Line: 2253 ]] --[[ Name: CompressZlibWithDict ]]
    -- upvalues: v52 (copy), l_error_0 (copy), v507 (copy)
    local v528, v529 = v52(v525, true, v526, true, v527);
    if not v528 then
        l_error_0("Usage: LibDeflate:CompressZlibWithDict" .. "(str, dictionary, configs): " .. v529, 2);
    end;
    return v507(v525, v526, v527);
end;
local function v568(v530) --[[ Line: 2277 ]] --[[ Name: CreateReader ]]
    -- upvalues: v20 (copy), l_byte_0 (copy), v4 (copy), l_char_0 (copy), l_sub_0 (copy), v22 (copy)
    local v531 = #v530;
    local v532 = 1;
    local v533 = 0;
    local v534 = 0;
    return function(v535) --[[ Line: 2290 ]] --[[ Name: ReadBits ]]
        -- upvalues: v20 (ref), v533 (ref), v534 (ref), v530 (copy), v532 (ref), l_byte_0 (ref)
        local v536 = v20[v535];
        local v537 = nil;
        if v535 <= v533 then
            v537 = v534 % v536;
            v534 = (v534 - v537) / v536;
            v533 = v533 - v535;
            return v537;
        else
            local v538 = v20[v533];
            local v539, v540, v541, v542 = l_byte_0(v530, v532, v532 + 3);
            v534 = v534 + ((v539 or 0) + (v540 or 0) * 256 + (v541 or 0) * 65536 + (v542 or 0) * 16777216) * v538;
            v532 = v532 + 4;
            v533 = v533 + 32 - v535;
            v537 = v534 % v536;
            v534 = (v534 - v537) / v536;
            return v537;
        end;
    end, function(v543, v544, v545) --[[ Line: 2319 ]] --[[ Name: ReadBytes ]]
        -- upvalues: v533 (ref), v4 (ref), v534 (ref), l_char_0 (ref), v531 (copy), v532 (ref), v530 (copy), l_sub_0 (ref)
        v4(v533 % 8 == 0);
        local v546 = v533 / 8 < v543 and v533 / 8 or v543;
        for _ = 1, v546 do
            local v548 = v534 % 256;
            v545 = v545 + 1;
            v544[v545] = l_char_0(v548);
            v534 = (v534 - v548) / 256;
        end;
        v533 = v533 - v546 * 8;
        v543 = v543 - v546;
        if (v531 - v532 - v543 + 1) * 8 + v533 < 0 then
            return -1;
        else
            for v549 = v532, v532 + v543 - 1 do
                v545 = v545 + 1;
                v544[v545] = l_sub_0(v530, v549, v549);
            end;
            v532 = v532 + v543;
            return v545;
        end;
    end, function(v550, v551, v552) --[[ Line: 2356 ]] --[[ Name: Decode ]]
        -- upvalues: v533 (ref), v530 (copy), v20 (ref), v532 (ref), l_byte_0 (ref), v534 (ref), v22 (ref)
        local v553 = 0;
        local v554 = 0;
        local v555 = 0;
        local v556 = nil;
        if v552 > 0 then
            if v533 < 15 and v530 then
                local v557 = v20[v533];
                local v558, v559, v560, v561 = l_byte_0(v530, v532, v532 + 3);
                v534 = v534 + ((v558 or 0) + (v559 or 0) * 256 + (v560 or 0) * 65536 + (v561 or 0) * 16777216) * v557;
                v532 = v532 + 4;
                v533 = v533 + 32;
            end;
            local v562 = v20[v552];
            v533 = v533 - v552;
            v553 = v534 % v562;
            v534 = (v534 - v553) / v562;
            v553 = v22[v552][v553];
            v556 = v550[v552];
            if v553 < v556 then
                return v551[v553];
            else
                v555 = v556;
                v554 = v556 * 2;
                v553 = v553 * 2;
            end;
        end;
        for v563 = v552 + 1, 15 do
            local v564 = nil;
            v564 = v534 % 2;
            v534 = (v534 - v564) / 2;
            v533 = v533 - 1;
            v553 = v564 == 1 and v553 + 1 - v553 % 2 or v553;
            v556 = v550[v563] or 0;
            local v565 = v553 - v554;
            if v565 < v556 then
                return v551[v555 + v565];
            else
                v555 = v555 + v556;
                v554 = (v554 + v556) * 2;
                v553 = v553 * 2;
            end;
        end;
        return -10;
    end, function() --[[ Line: 2412 ]] --[[ Name: ReaderBitlenLeft ]]
        -- upvalues: v531 (copy), v532 (ref), v533 (ref)
        return (v531 - v532 + 1) * 8 + v533;
    end, function() --[[ Line: 2416 ]] --[[ Name: SkipToByteBoundary ]]
        -- upvalues: v533 (ref), v20 (ref), v534 (ref)
        local v566 = v533 % 8;
        local v567 = v20[v566];
        v533 = v533 - v566;
        v534 = (v534 - v534 % v567) / v567;
    end;
end;
local function v576(v569, v570) --[[ Line: 2431 ]] --[[ Name: CreateDecompressState ]]
    -- upvalues: v568 (copy)
    local v571, v572, v573, v574, v575 = v568(v569);
    return {
        ReadBits = v571, 
        ReadBytes = v572, 
        Decode = v573, 
        ReaderBitlenLeft = v574, 
        SkipToByteBoundary = v575, 
        buffer_size = 0, 
        buffer = {}, 
        result_buffer = {}, 
        dictionary = v570
    };
end;
local function v591(v577, v578, v579) --[[ Line: 2458 ]] --[[ Name: GetHuffmanForDecode ]]
    local v580 = {};
    local l_v579_0 = v579;
    for v582 = 0, v578 do
        local v583 = v577[v582] or 0;
        l_v579_0 = v583 > 0 and v583 < l_v579_0 and v583 or l_v579_0;
        v580[v583] = (v580[v583] or 0) + 1;
    end;
    if v580[0] == v578 + 1 then
        return 0, v580, {}, 0;
    else
        local v584 = 1;
        for v585 = 1, v579 do
            v584 = v584 * 2 - (v580[v585] or 0);
            if v584 < 0 then
                return v584;
            end;
        end;
        local v586 = {
            [1] = 0
        };
        for v587 = 1, v579 - 1 do
            v586[v587 + 1] = v586[v587] + (v580[v587] or 0);
        end;
        local v588 = {};
        for v589 = 0, v578 do
            local v590 = v577[v589] or 0;
            if v590 ~= 0 then
                v588[v586[v590]] = v589;
                v586[v590] = v586[v590] + 1;
            end;
        end;
        return v584, v580, v588, l_v579_0;
    end;
end;
local function v619(v592, v593, v594, v595, v596, v597, v598) --[[ Line: 2509 ]] --[[ Name: DecodeUntilEndOfBlock ]]
    -- upvalues: v21 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), l_concat_0 (copy)
    local l_buffer_0 = v592.buffer;
    local l_buffer_size_0 = v592.buffer_size;
    local l_ReadBits_0 = v592.ReadBits;
    local l_Decode_0 = v592.Decode;
    local l_ReaderBitlenLeft_0 = v592.ReaderBitlenLeft;
    local l_result_buffer_0 = v592.result_buffer;
    local l_dictionary_0 = v592.dictionary;
    local v606 = nil;
    local v607 = nil;
    local v608 = 1;
    if l_dictionary_0 and not l_buffer_0[0] then
        v606 = l_dictionary_0.string_table;
        v607 = l_dictionary_0.strlen;
        v608 = -v607 + 1;
        local v609 = 0;
        local v610 = -v607 + 1 < -257 and -257 or -v607 + 1;
        for v611 = v609, v610, -1 do
            l_buffer_0[v611] = v21[v606[v607 + v611]];
        end;
    end;
    while true do
        local v612 = l_Decode_0(v593, v594, v595);
        if v612 < 0 or v612 > 285 then
            return -10;
        else
            if v612 < 256 then
                l_buffer_size_0 = l_buffer_size_0 + 1;
                l_buffer_0[l_buffer_size_0] = v21[v612];
            elseif v612 > 256 then
                v612 = v612 - 256;
                local v613 = v29[v612];
                v613 = v612 >= 8 and v613 + l_ReadBits_0(v30[v612]) or v613;
                v612 = l_Decode_0(v596, v597, v598);
                if v612 < 0 or v612 > 29 then
                    return -10;
                else
                    local v614 = v31[v612];
                    local v615 = l_buffer_size_0 - (v614 > 4 and v614 + l_ReadBits_0(v32[v612]) or v614) + 1;
                    if v615 < v608 then
                        return -11;
                    elseif v615 >= -257 then
                        for _ = 1, v613 do
                            l_buffer_size_0 = l_buffer_size_0 + 1;
                            l_buffer_0[l_buffer_size_0] = l_buffer_0[v615];
                            v615 = v615 + 1;
                        end;
                    else
                        v615 = v607 + v615;
                        for _ = 1, v613 do
                            l_buffer_size_0 = l_buffer_size_0 + 1;
                            l_buffer_0[l_buffer_size_0] = v21[v606[v615]];
                            v615 = v615 + 1;
                        end;
                    end;
                end;
            end;
            if l_ReaderBitlenLeft_0() < 0 then
                return 2;
            else
                if l_buffer_size_0 >= 65536 then
                    l_result_buffer_0[#l_result_buffer_0 + 1] = l_concat_0(l_buffer_0, "", 1, 32768);
                    for v618 = 32769, l_buffer_size_0 do
                        l_buffer_0[v618 - 32768] = l_buffer_0[v618];
                    end;
                    l_buffer_size_0 = l_buffer_size_0 - 32768;
                    l_buffer_0[l_buffer_size_0 + 1] = nil;
                end;
                if v612 == 256 then
                    v592.buffer_size = l_buffer_size_0;
                    return 0;
                end;
            end;
        end;
    end;
end;
local function v631(v620) --[[ Line: 2607 ]] --[[ Name: DecompressStoreBlock ]]
    -- upvalues: l_concat_0 (copy)
    local l_buffer_1 = v620.buffer;
    local l_buffer_size_1 = v620.buffer_size;
    local l_ReadBits_1 = v620.ReadBits;
    local l_ReadBytes_0 = v620.ReadBytes;
    local l_ReaderBitlenLeft_1 = v620.ReaderBitlenLeft;
    local l_SkipToByteBoundary_0 = v620.SkipToByteBoundary;
    local l_result_buffer_1 = v620.result_buffer;
    l_SkipToByteBoundary_0();
    local v628 = l_ReadBits_1(16);
    if l_ReaderBitlenLeft_1() < 0 then
        return 2;
    else
        local v629 = l_ReadBits_1(16);
        if l_ReaderBitlenLeft_1() < 0 then
            return 2;
        elseif v628 % 256 + v629 % 256 ~= 255 then
            return -2;
        elseif (v628 - v628 % 256) / 256 + (v629 - v629 % 256) / 256 ~= 255 then
            return -2;
        else
            l_buffer_size_1 = l_ReadBytes_0(v628, l_buffer_1, l_buffer_size_1);
            if l_buffer_size_1 < 0 then
                return 2;
            else
                if l_buffer_size_1 >= 65536 then
                    l_result_buffer_1[#l_result_buffer_1 + 1] = l_concat_0(l_buffer_1, "", 1, 32768);
                    for v630 = 32769, l_buffer_size_1 do
                        l_buffer_1[v630 - 32768] = l_buffer_1[v630];
                    end;
                    l_buffer_size_1 = l_buffer_size_1 - 32768;
                    l_buffer_1[l_buffer_size_1 + 1] = nil;
                end;
                v620.buffer_size = l_buffer_size_1;
                return 0;
            end;
        end;
    end;
end;
local function _(v632) --[[ Line: 2653 ]] --[[ Name: DecompressFixBlock ]]
    -- upvalues: v619 (copy), v37 (ref), v35 (ref), v41 (ref), v39 (ref)
    return (v619(v632, v37, v35, 7, v41, v39, 5));
end;
local function v659(v634) --[[ Line: 2664 ]] --[[ Name: DecompressDynamicBlock ]]
    -- upvalues: v33 (copy), v591 (copy), v619 (copy)
    local l_ReadBits_2 = v634.ReadBits;
    local l_Decode_1 = v634.Decode;
    local v637 = l_ReadBits_2(5) + 257;
    local v638 = l_ReadBits_2(5) + 1;
    local v639 = l_ReadBits_2(4) + 4;
    if v637 > 286 or v638 > 30 then
        return -3;
    else
        local v640 = {};
        for v641 = 1, v639 do
            v640[v33[v641]] = l_ReadBits_2(3);
        end;
        local v642, v643, v644, v645 = v591(v640, 18, 7);
        if v642 ~= 0 then
            return -4;
        else
            local v646 = {};
            local v647 = {};
            local v648 = 0;
            while true do
                if v648 < v637 + v638 then
                    local v649 = nil;
                    local v650 = nil;
                    v649 = l_Decode_1(v643, v644, v645);
                    if v649 < 0 then
                        return v649;
                    elseif v649 < 16 then
                        if v648 < v637 then
                            v646[v648] = v649;
                        else
                            v647[v648 - v637] = v649;
                        end;
                        v648 = v648 + 1;
                    else
                        v650 = 0;
                        if v649 == 16 then
                            if v648 == 0 then
                                return -5;
                            else
                                v650 = if v648 - 1 < v637 then v646[v648 - 1] else v647[v648 - v637 - 1];
                                v649 = 3 + l_ReadBits_2(2);
                            end;
                        else
                            v649 = if v649 == 17 then 3 + l_ReadBits_2(3) else 11 + l_ReadBits_2(7);
                        end;
                        if v648 + v649 > v637 + v638 then
                            return -6;
                        else
                            while v649 > 0 do
                                v649 = v649 - 1;
                                if v648 < v637 then
                                    v646[v648] = v650;
                                else
                                    v647[v648 - v637] = v650;
                                end;
                                v648 = v648 + 1;
                            end;
                        end;
                    end;
                elseif (v646[256] or 0) == 0 then
                    return -9;
                else
                    local v651, v652, v653, v654 = v591(v646, v637 - 1, 15);
                    if v651 ~= 0 and (v651 < 0 or v637 ~= (v652[0] or 0) + (v652[1] or 0)) then
                        return -7;
                    else
                        local v655, v656, v657, v658 = v591(v647, v638 - 1, 15);
                        if v655 ~= 0 and (v655 < 0 or v638 ~= (v656[0] or 0) + (v656[1] or 0)) then
                            return -8;
                        else
                            return (v619(v634, v652, v653, v654, v656, v657, v658));
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function v665(v660) --[[ Line: 2782 ]] --[[ Name: Inflate ]]
    -- upvalues: v631 (copy), v619 (copy), v37 (ref), v35 (ref), v41 (ref), v39 (ref), v659 (copy), l_concat_0 (copy)
    local l_ReadBits_3 = v660.ReadBits;
    local v662 = nil;
    while true do
        if not v662 then
            v662 = l_ReadBits_3(1) == 1;
            local v663 = l_ReadBits_3(2);
            local v664 = nil;
            if v663 == 0 then
                v664 = v631(v660);
            elseif v663 == 1 then
                v664 = v619(v660, v37, v35, 7, v41, v39, 5);
            elseif v663 == 2 then
                v664 = v659(v660);
            else
                return nil, -1;
            end;
            if v664 ~= 0 then
                return nil, v664;
            end;
        else
            v660.result_buffer[#v660.result_buffer + 1] = l_concat_0(v660.buffer, "", 1, v660.buffer_size);
            return (l_concat_0(v660.result_buffer));
        end;
    end;
end;
local function v672(v666, v667) --[[ Line: 2812 ]] --[[ Name: DecompressDeflateInternal ]]
    -- upvalues: v576 (copy), v665 (copy)
    local v668 = v576(v666, v667);
    local v669, v670 = v665(v668);
    if not v669 then
        return nil, v670;
    else
        local v671 = v668.ReaderBitlenLeft();
        return v669, (v671 - v671 % 8) / 8;
    end;
end;
local function v698(v673, v674) --[[ Line: 2826 ]] --[[ Name: DecompressZlibInternal ]]
    -- upvalues: v576 (copy), v665 (copy), v1 (ref)
    local v675 = v576(v673, v674);
    local l_ReadBits_4 = v675.ReadBits;
    local v677 = l_ReadBits_4(8);
    if v675.ReaderBitlenLeft() < 0 then
        return nil, 2;
    else
        local v678 = v677 % 16;
        local v679 = (v677 - v678) / 16;
        if v678 ~= 8 then
            return nil, -12;
        elseif v679 > 7 then
            return nil, -13;
        else
            local v680 = l_ReadBits_4(8);
            if v675.ReaderBitlenLeft() < 0 then
                return nil, 2;
            elseif (v677 * 256 + v680) % 31 ~= 0 then
                return nil, -14;
            else
                local v681 = (v680 - v680 % 32) / 32 % 2;
                local _ = (v680 - v680 % 64) / 64 % 4;
                if v681 == 1 then
                    if not v674 then
                        return nil, -16;
                    else
                        local v683 = l_ReadBits_4(8);
                        local v684 = l_ReadBits_4(8);
                        local v685 = l_ReadBits_4(8);
                        local v686 = l_ReadBits_4(8);
                        local v687 = v683 * 16777216 + v684 * 65536 + v685 * 256 + v686;
                        if v675.ReaderBitlenLeft() < 0 then
                            return nil, 2;
                        else
                            local l_adler32_1 = v674.adler32;
                            if not (v687 % 4294967296 == l_adler32_1 % 4294967296) then
                                return nil, -17;
                            end;
                        end;
                    end;
                end;
                local v689, v690 = v665(v675);
                if not v689 then
                    return nil, v690;
                else
                    v675.SkipToByteBoundary();
                    local v691 = l_ReadBits_4(8);
                    local v692 = l_ReadBits_4(8);
                    local v693 = l_ReadBits_4(8);
                    local v694 = l_ReadBits_4(8);
                    if v675.ReaderBitlenLeft() < 0 then
                        return nil, 2;
                    else
                        local v695 = v691 * 16777216 + v692 * 65536 + v693 * 256 + v694;
                        local v696 = v1:Adler32(v689);
                        if not (v695 % 4294967296 == v696 % 4294967296) then
                            return nil, -15;
                        else
                            local v697 = v675.ReaderBitlenLeft();
                            return v689, (v697 - v697 % 8) / 8;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v1.DecompressDeflate = function(_, v700) --[[ Line: 2909 ]] --[[ Name: DecompressDeflate ]]
    -- upvalues: l_type_0 (copy), l_error_0 (copy), v672 (copy)
    local v701, v702;
    if l_type_0(v700) ~= "string" then
        v701 = false;
        v702 = ("'str' - string expected got '%s'."):format((l_type_0(v700)));
    else
        v701 = true;
        v702 = "";
    end;
    if not v701 then
        l_error_0("Usage: LibDeflate:DecompressDeflate(str): " .. v702, 2);
    end;
    return v672(v700);
end;
v1.DecompressDeflateWithDict = function(_, v704, v705) --[[ Line: 2936 ]] --[[ Name: DecompressDeflateWithDict ]]
    -- upvalues: l_type_0 (copy), v50 (copy), l_error_0 (copy), v672 (copy)
    local v706, v707;
    if l_type_0(v704) ~= "string" then
        v706 = false;
        v707 = ("'str' - string expected got '%s'."):format((l_type_0(v704)));
    else
        local v708, v709 = v50(v705);
        if not v708 then
            v706 = false;
            v707 = v709;
        else
            v706 = true;
            v707 = "";
        end;
    end;
    if not v706 then
        l_error_0("Usage: LibDeflate:DecompressDeflateWithDict(str, dictionary): " .. v707, 2);
    end;
    return v672(v704, v705);
end;
v1.DecompressZlib = function(_, v711) --[[ Line: 2958 ]] --[[ Name: DecompressZlib ]]
    -- upvalues: l_type_0 (copy), l_error_0 (copy), v698 (copy)
    local v712, v713;
    if l_type_0(v711) ~= "string" then
        v712 = false;
        v713 = ("'str' - string expected got '%s'."):format((l_type_0(v711)));
    else
        v712 = true;
        v713 = "";
    end;
    if not v712 then
        l_error_0("Usage: LibDeflate:DecompressZlib(str): " .. v713, 2);
    end;
    return v698(v711);
end;
v1.DecompressZlibWithDict = function(_, v715, v716) --[[ Line: 2985 ]] --[[ Name: DecompressZlibWithDict ]]
    -- upvalues: l_type_0 (copy), v50 (copy), l_error_0 (copy), v698 (copy)
    local v717, v718;
    if l_type_0(v715) ~= "string" then
        v717 = false;
        v718 = ("'str' - string expected got '%s'."):format((l_type_0(v715)));
    else
        local v719, v720 = v50(v716);
        if not v719 then
            v717 = false;
            v718 = v720;
        else
            v717 = true;
            v718 = "";
        end;
    end;
    if not v717 then
        l_error_0("Usage: LibDeflate:DecompressZlibWithDict(str, dictionary): " .. v718, 2);
    end;
    return v698(v715, v716);
end;
v36 = {};
for v721 = 0, 143 do
    v36[v721] = 8;
end;
for v722 = 144, 255 do
    v36[v722] = 9;
end;
v36[256] = 7;
v36[257] = 7;
v36[258] = 7;
v36[259] = 7;
v36[260] = 7;
v36[261] = 7;
v36[262] = 7;
v36[263] = 7;
v36[264] = 7;
v36[265] = 7;
v36[266] = 7;
v36[267] = 7;
v36[268] = 7;
v36[269] = 7;
v36[270] = 7;
v36[271] = 7;
v36[272] = 7;
v36[273] = 7;
v36[274] = 7;
v36[275] = 7;
v36[276] = 7;
v36[277] = 7;
v36[278] = 7;
v36[279] = 7;
v36[280] = 8;
v36[281] = 8;
v36[282] = 8;
v36[283] = 8;
v36[284] = 8;
v36[285] = 8;
v36[286] = 8;
v36[287] = 8;
v40 = {};
for v723 = 0, 31 do
    v40[v723] = 5;
end;
local v724 = nil;
local v725, v726, v727 = v591(v36, 287, 9);
v724 = v725;
v37 = v726;
v35 = v727;
v4(v724 == 0);
v725, v726, v727 = v591(v40, 31, 5);
v724 = v725;
v41 = v726;
v39 = v727;
v4(v724 == 0);
v34 = v155(v37, v36, 287, 9);
v38 = v155(v41, v40, 31, 5);
v724 = {
    ["\000"] = "%z", 
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
};
v725 = function(v728) --[[ Line: 3049 ]] --[[ Name: escape_for_gsub ]]
    -- upvalues: v724 (copy)
    return v728:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724);
end;
v1.CreateCodec = function(_, v730, v731, v732) --[[ Line: 3093 ]] --[[ Name: CreateCodec ]]
    -- upvalues: l_type_0 (copy), l_error_0 (copy), l_byte_0 (copy), l_sub_0 (copy), l_concat_0 (copy), v724 (copy), v21 (copy), l_gsub_0 (copy), l_find_0 (copy)
    if l_type_0(v730) ~= "string" or l_type_0(v731) ~= "string" or l_type_0(v732) ~= "string" then
        l_error_0("Usage: LibDeflate:CreateCodec(reserved_chars, escape_chars, map_chars): All arguments must be string.", 2);
    end;
    if v731 == "" then
        return nil, "No escape characters supplied.";
    elseif #v730 < #v732 then
        return nil, "The number of reserved characters must be at least as many as the number of mapped chars.";
    elseif v730 == "" then
        return nil, "No characters to encode.";
    else
        local v733 = v730 .. v731 .. v732;
        local v734 = {};
        for v735 = 1, #v733 do
            local v736 = l_byte_0(v733, v735, v735);
            if v734[v736] then
                return nil, "There must be no duplicate characters in the concatenation of reserved_chars, escape_chars and map_chars.";
            else
                v734[v736] = true;
            end;
        end;
        local v737 = {};
        local v738 = {};
        local v739 = {};
        local v740 = {};
        if #v732 > 0 then
            local v741 = {};
            local v742 = {};
            for v743 = 1, #v732 do
                local v744 = l_sub_0(v730, v743, v743);
                local v745 = l_sub_0(v732, v743, v743);
                v740[v744] = v745;
                v739[#v739 + 1] = v744;
                v742[v745] = v744;
                v741[#v741 + 1] = v745;
            end;
            v737[#v737 + 1] = "([" .. l_concat_0(v741):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724) .. "])";
            v738[#v738 + 1] = v742;
        end;
        local v746 = 1;
        local v747 = l_sub_0(v731, v746, v746);
        local v748 = 0;
        local v749 = {};
        local v750 = {};
        for v751 = 1, #v733 do
            local v752 = l_sub_0(v733, v751, v751);
            if not v740[v752] then
                while true do
                    if v748 >= 256 or v734[v748] then
                        v748 = v748 + 1;
                        if v748 > 255 then
                            v737[#v737 + 1] = v747:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724) .. "([" .. l_concat_0(v749):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724) .. "])";
                            v738[#v738 + 1] = v750;
                            v746 = v746 + 1;
                            v747 = l_sub_0(v731, v746, v746);
                            v748 = 0;
                            v749 = {};
                            v750 = {};
                            if not v747 or v747 == "" then
                                return nil, "Out of escape characters.";
                            end;
                        end;
                    else
                        local v753 = v21[v748];
                        v740[v752] = v747 .. v753;
                        v739[#v739 + 1] = v752;
                        v750[v753] = v752;
                        v749[#v749 + 1] = v753;
                        v748 = v748 + 1;
                        break;
                    end;
                end;
            end;
            if v751 == #v733 then
                v737[#v737 + 1] = v747:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724) .. "([" .. l_concat_0(v749):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724) .. "])";
                v738[#v738 + 1] = v750;
            end;
        end;
        local v754 = {};
        local v755 = "([" .. l_concat_0(v739):gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724) .. "])";
        v754.Encode = function(_, v757) --[[ Line: 3211 ]] --[[ Name: Encode ]]
            -- upvalues: l_type_0 (ref), l_error_0 (ref), l_gsub_0 (ref), v755 (copy), v740 (copy)
            if l_type_0(v757) ~= "string" then
                l_error_0(("Usage: codec:Encode(str): 'str' - string expected got '%s'."):format((l_type_0(v757))), 2);
            end;
            return l_gsub_0(v757, v755, v740);
        end;
        local v758 = #v737;
        local v759 = "([" .. v730:gsub("([%z%(%)%.%%%+%-%*%?%[%]%^%$])", v724) .. "])";
        v754.Decode = function(_, v761) --[[ Line: 3223 ]] --[[ Name: Decode ]]
            -- upvalues: l_type_0 (ref), l_error_0 (ref), l_find_0 (ref), v759 (copy), v758 (copy), l_gsub_0 (ref), v737 (copy), v738 (copy)
            if l_type_0(v761) ~= "string" then
                l_error_0(("Usage: codec:Decode(str): 'str' - string expected got '%s'."):format((l_type_0(v761))), 2);
            end;
            if l_find_0(v761, v759) then
                return nil;
            else
                for v762 = 1, v758 do
                    v761 = l_gsub_0(v761, v737[v762], v738[v762]);
                end;
                return v761;
            end;
        end;
        return v754;
    end;
end;
v726 = nil;
v727 = {
    [0] = "a"; 
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
};
local v763 = {
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
};
v1.EncodeForPrint = function(_, v765) --[[ Line: 3282 ]] --[[ Name: EncodeForPrint ]]
    -- upvalues: l_type_0 (copy), l_error_0 (copy), l_byte_0 (copy), v727 (copy), v20 (copy), l_concat_0 (copy)
    if l_type_0(v765) ~= "string" then
        l_error_0(("Usage: LibDeflate:EncodeForPrint(str): 'str' - string expected got '%s'."):format((l_type_0(v765))), 2);
    end;
    local v766 = #v765;
    local v767 = v766 - 2;
    local v768 = 1;
    local v769 = {};
    local v770 = 0;
    while v768 <= v767 do
        local v771, v772, v773 = l_byte_0(v765, v768, v768 + 2);
        v768 = v768 + 3;
        local v774 = v771 + v772 * 256 + v773 * 65536;
        local v775 = v774 % 64;
        v774 = (v774 - v775) / 64;
        local v776 = v774 % 64;
        v774 = (v774 - v776) / 64;
        local v777 = v774 % 64;
        local v778 = (v774 - v777) / 64;
        v770 = v770 + 1;
        v769[v770] = v727[v775] .. v727[v776] .. v727[v777] .. v727[v778];
    end;
    local v779 = 0;
    local v780 = 0;
    while v768 <= v766 do
        v779 = v779 + l_byte_0(v765, v768, v768) * v20[v780];
        v780 = v780 + 8;
        v768 = v768 + 1;
    end;
    while v780 > 0 do
        local v781 = v779 % 64;
        v770 = v770 + 1;
        v769[v770] = v727[v781];
        v779 = (v779 - v781) / 64;
        v780 = v780 - 6;
    end;
    return l_concat_0(v769);
end;
v1.DecodeForPrint = function(_, v783) --[[ Line: 3337 ]] --[[ Name: DecodeForPrint ]]
    -- upvalues: l_type_0 (copy), l_error_0 (copy), l_byte_0 (copy), v763 (copy), v21 (copy), v20 (copy), l_concat_0 (copy)
    if l_type_0(v783) ~= "string" then
        l_error_0(("Usage: LibDeflate:DecodeForPrint(str): 'str' - string expected got '%s'."):format((l_type_0(v783))), 2);
    end;
    v783 = v783:gsub("^[%c ]+", ""):gsub("[%c ]+$", "");
    local v784 = #v783;
    if v784 == 1 then
        return nil;
    else
        local v785 = v784 - 3;
        local v786 = 1;
        local v787 = {};
        local v788 = 0;
        while true do
            if v786 <= v785 then
                local v789, v790, v791, v792 = l_byte_0(v783, v786, v786 + 3);
                v789 = v763[v789];
                v790 = v763[v790];
                v791 = v763[v791];
                v792 = v763[v792];
                if not v789 or not v790 or not v791 or not v792 then
                    return nil;
                else
                    v786 = v786 + 4;
                    local v793 = v789 + v790 * 64 + v791 * 4096 + v792 * 262144;
                    local v794 = v793 % 256;
                    v793 = (v793 - v794) / 256;
                    local v795 = v793 % 256;
                    local v796 = (v793 - v795) / 256;
                    v788 = v788 + 1;
                    v787[v788] = v21[v794] .. v21[v795] .. v21[v796];
                end;
            else
                local v797 = 0;
                local v798 = 0;
                while true do
                    if v786 <= v784 then
                        local v799 = v763[l_byte_0(v783, v786, v786)];
                        if not v799 then
                            return nil;
                        else
                            v797 = v797 + v799 * v20[v798];
                            v798 = v798 + 6;
                            v786 = v786 + 1;
                        end;
                    else
                        while v798 >= 8 do
                            local v800 = v797 % 256;
                            v788 = v788 + 1;
                            v787[v788] = v21[v800];
                            v797 = (v797 - v800) / 256;
                            v798 = v798 - 8;
                        end;
                        return l_concat_0(v787);
                    end;
                end;
            end;
        end;
    end;
end;
local function v801() --[[ Line: 3397 ]] --[[ Name: InternalClearCache ]]
    -- upvalues: v726 (ref)
    v726 = nil;
end;
v1.internals = {
    LoadStringToTable = v244, 
    IsValidDictionary = v50, 
    IsEqualAdler32 = v43, 
    _byte_to_6bit_char = v727, 
    _6bit_to_byte = v763, 
    InternalClearCache = v801
};
return v0;
