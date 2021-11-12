///choose_encounter(encounter_1, chance_1, encounter_2, chance_2, encounter_3, chance_3, ...)
var encounterChance;
encounterChance = random(1);
n = 0
for (i = 0; i < argument_count; i += 2)
{
    n += argument[i + 1];
    if n > encounterChance
    {
        return argument[i];
    }
}
return noone;
