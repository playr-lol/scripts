--!native
local l_concat_0 = table.concat;
local l_byte_0 = string.byte;
local l_char_0 = string.char;
local v3 = {
    [0] = "A"; 
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
    "'", 
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
};
local v4 = {};
for v5 = 0, 255 do
    v4[v5] = 255;
end;
for v6 = 0, #v3 do
    v4[l_byte_0(v3[v6])] = v6;
end;
local v7 = {};
for v8 = 0, 30 do
    v7[v8] = 2 ^ v8;
end;
local v9 = {};
for v10 = 0, 255 do
    v9[v10] = l_char_0(v10);
end;
return {
    encode = function(v11) --[[ Line: 60 ]] --[[ Name: encode ]]
        -- upvalues: l_byte_0 (copy), v7 (copy), v3 (copy), l_concat_0 (copy)
        local v12 = 0;
        local v13 = 0;
        local v14 = {};
        local v15 = 1;
        for v16 = 1, #v11 do
            v12 = v12 + l_byte_0(v11, v16) * v7[v13];
            v13 = v13 + 8;
            while v13 > 13 do
                local v17 = v12 % 8192;
                if v17 > 456 then
                    v12 = v12 // 8192;
                    v13 = v13 - 13;
                else
                    v17 = v12 % 16384;
                    v12 = v12 // 16384;
                    v13 = v13 - 14;
                end;
                v14[v15] = v3[v17 % 93];
                v15 = v15 + 1;
                v14[v15] = v3[v17 // 93];
                v15 = v15 + 1;
            end;
        end;
        if v13 > 0 then
            v14[v15] = v3[v12 % 93];
            if v13 > 7 or v12 > 92 then
                v14[v15 + 1] = v3[v12 // 93];
            end;
        end;
        return l_concat_0(v14);
    end, 
    decode = function(v18) --[[ Line: 98 ]] --[[ Name: decode ]]
        -- upvalues: l_byte_0 (copy), v4 (copy), v7 (copy), v9 (copy), l_concat_0 (copy)
        local v19 = 0;
        local v20 = 0;
        local v21 = {};
        local v22 = 1;
        local v23 = #v18;
        local v24 = v23 // 2 * 2;
        for v25 = 1, v24, 2 do
            local v26, v27 = l_byte_0(v18, v25, v25 + 1);
            v26 = v4[v26];
            v27 = v4[v27];
            if v26 == 255 or v27 == 255 then
                error("malformed base93 data stream");
            end;
            local v28 = v26 + v27 * 93;
            v19 = v19 + v28 * v7[v20];
            v20 = v20 + (v28 % 8192 > 456 and 13 or 14);
            while v20 > 7 do
                v21[v22] = v9[v19 % 256];
                v22 = v22 + 1;
                v19 = v19 // 256;
                v20 = v20 - 8;
            end;
        end;
        if v24 < v23 then
            local v29 = v4[l_byte_0(v18, v23)];
            if v29 == 255 then
                error("malformed base93 data stream");
            end;
            v21[v22] = v9[v19 + v29 * v7[v20]];
        end;
        return l_concat_0(v21);
    end
};
