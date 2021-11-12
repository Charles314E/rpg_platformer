///gain_experience(monster[, exp])
with obj_Player
{
    if argument[0] != noone
    {
        var monster = argument[0];
        EXP += monster.lootExp;
        EXPAcc += monster.lootExp;
    }
    if argument_count > 1
    {
        EXP += argument[1];
        EXPAcc += argument[1];
    }
    if EXP >= ToNextLevel
    {
        level_up();
    }
}
