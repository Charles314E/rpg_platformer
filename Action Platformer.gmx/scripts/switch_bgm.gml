///switch_bgm(track, volume, intro, loop)
new_bgm = argument[0];
vol = argument[1];
intro = argument[2];
if argument_count > 3
{
    loop = argument[3];
    if loop = 0
    {
        loop = audio_sound_length(bgm) - intro - 2;
    }
}
else
{
    loop = audio_sound_length(bgm) - intro - 2;
}

show_debug_message("[BGM]: Object " + string(object_index) + ", " + object_get_name(object_index) + " switched the BGM from " + audio_get_name(obj_Music.bgm_current) + " to " + audio_get_name(new_bgm) + ", volume " + string(vol) + ".")

if instance_exists(obj_Music)
{
    with obj_Music
    {
        if bgm != noone
        {
            audio_sound_gain(bgm, 0, 1);
        }
        bgm_current = other.new_bgm;
        if bgm_current != noone
        {
            bgm = audio_play_sound(bgm_current, 100, false);
            audio_sound_gain(bgm, other.vol, 1);
        }
        else
        {
            bgm = noone;
        }
        intro_length = other.intro;
        loop_length = other.loop;
        total_length = intro_length + loop_length;
    }
}
else
{
    with instance_create(0, 0, obj_Music)
    {
        bgm_current = other.bgm
        bgm = audio_play_sound(bgm_current, 100, false);
        audio_sound_gain(bgm, other.vol, 1);
        intro_length = other.intro;
        loop_length = other.loop;
        total_length = intro_length + loop_length;
    }
}
