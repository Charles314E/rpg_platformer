///string_flupper(string)
var str, str1, str2;
str = argument[0];

str1 = string_upper(string_char_at(str, 1));
str2 = "";
for (i = 1; i < string_length(str); i += 1)
{
    str2 += string_lower(string_char_at(str, i + 1));
}
return str1 + str2;
