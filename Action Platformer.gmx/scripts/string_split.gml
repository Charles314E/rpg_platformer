///string_split(str, sep1, [sep2, ...])
str = argument[0];
sep_array = ds_list_create();
for (i = 1; i < argument_count; i += 1) {
    ds_list_add(sep_array, argument[i]);
}
array = ds_list_create();
substring = "";
for (i = 0; i < string_length(str); i += 1) {
    Done = false;
    for (n = 0; n < ds_list_size(sep_array); n += 1) {
        if (not Done) {
            if (string_char_at(str, i + 1) = ds_list_find_value(sep_array, n)) {
                ds_list_add(array, substring);
                substring = "";
                i += 1;
                Done = true;
            }
        }
    }
    substring += string_char_at(str, i + 1);
}
ds_list_add(array, substring);
return array;
