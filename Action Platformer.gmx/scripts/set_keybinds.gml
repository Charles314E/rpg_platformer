///set_keybinds(up, left, down, right, attack, interact, menu, debug, ready, restart, kill, mb_interact, [gender])
//var up, left, down, right, attack, interact, menu, debug, ready, restart, kill, mouseInteract; 
up = argument[0];
left = argument[1];
down = argument[2];
right = argument[3];
attack = argument[4];
interact = argument[5];
menu = argument[6];
debug = argument[7];
ready = argument[8];
restart = argument[9];
kill = argument[10];
mouseInteract = argument[11];
if argument_count = 13
{
    gender = argument[12];
}

kpJump = keyboard_check_pressed(other.up);
kpUp = keyboard_check_pressed(other.up);
kpLeft = keyboard_check_pressed(other.left);
kpDown = keyboard_check_pressed(other.down);
kpRight = keyboard_check_pressed(other.right);
kpAttack = keyboard_check_pressed(other.attack);
kpInteract = keyboard_check_pressed(other.interact);
kpMenu = keyboard_check_pressed(other.menu);
if debug_mode
{
    kpDebug = keyboard_check_pressed(other.debug);
    kpRestart = keyboard_check_pressed(other.restart);
    kpKill = keyboard_check_pressed(other.kill);
    if argument_count = 13
    {
        kpGenderSwitch = keyboard_check_pressed(other.gender);
    }
}
else
{
    kpDebug = false;
    kpRestart = false;
    kpKill = false;
    kpGenderSwitch = false;
}

khJump = keyboard_check(other.up);
khUp = keyboard_check(other.up);
khLeft = keyboard_check(other.left);
khDown = keyboard_check(other.down);
khRight = keyboard_check(other.right);
khAttack = keyboard_check(other.attack);
khShift = keyboard_check(other.ready);
khInteract = keyboard_check(other.interact);

krShift = keyboard_check_released(other.ready);

mbInteract = mouse_check_button_pressed(other.mouseInteract);
