///cutscene_start(inst, ind)
with argument[0]
{
    timeline_index = argument[1];
    timeline_position = 0;
    timeline_running = true;
    show_debug_message("[DBG]: Object " + string(self) + ", " + object_get_name(object_index) + " started the cutscene " + timeline_get_name(timeline_index) + ".");
}
