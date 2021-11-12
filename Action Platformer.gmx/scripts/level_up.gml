///level_up()
with obj_Player
{
    while EXP >= ToNextLevel
    {
        Level += 1;
        EXP = EXP - ToNextLevel;
        ToNextLevel = int64(LevelBase + (LevelMultiplier * power(1 + LevelExponent, Level)));
        show_debug_message("[DBG]: " + string(LevelBase) + " + " + string(LevelMultiplier) + "(1 + " + string(LevelExponent) + ")^" + string(Level) + " = " + string(ToNextLevel));
        show_debug_message("[DBG]: " + string(ToNextLevel) + " experience points to level " + string(Level + 1) + ".");
        
        statStrength += 1;
        statVitality += 1;
        statDexterity += 1;
        statFortitude += 1;
        statWisdom += 1;
        statMagic += 1;
        StatPoints += 2;
        SkillPoints += 1;
        obj_GUI.statPointSubimage = 0;
        obj_GUI.skillPointSubimage = 8;
        
        instance_create(0, 0, obj_LevelUp);
    }
    set_statistics(self, true);
}
