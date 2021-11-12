///generate_weapon_database()
var db = ds_list_create();
//Swords
ds_list_add(db, "Steel Sword",       sht_Swords,         0,  60,      "Sword",        "D", 0,     "A standard steel sword.");
ds_list_add(db, "Arming Sword",      sht_Swords,         1,  130,     "Sword",        "D", 2,     "A steel sword used by soldiers.");
ds_list_add(db, "Backsword",         sht_Swords,         2,  250,     "Sword",        "C", 3,     "A strong but unwieldy sword with its spine and edge reversed.");
ds_list_add(db, "Rapier",            sht_Swords,         3,  1000,    "Sword",        "C", 1,     "A thin, flexible sword used for thrusts.");
ds_list_add(db, "Shamshir",          sht_Swords,         4,  1600,    "Sword",        "B", 3,     "A curved, sharp sword used for slashing.");
//Axes
ds_list_add(db, "Hand Ax",           sht_Axes,           0,  65,      "Axe",          "D", 0,     "A small light axe for throwing.");
//Greatswords
ds_list_add(db, "Steel Greatsword",  sht_Greatswords,    0,  120,     "Greatsword",   "D", 2,     "A heavy steel bastard sword.");
ds_list_add(db, "Zweihander",        sht_Greatswords,    0,  300,     "Greatsword",   "D", 4,     "A more powerful greatsword that deals more damage.");
ds_list_add(db, "Sawtooth Slab",     sht_Greatswords,    0,  650,     "Greatsword",   "C", 6,     "This serrated greatsword inflicts bleeding on a heavy strike.");
ds_list_add(db, "Claymore",          sht_Greatswords,    0,  2000,    "Greatsword",   "B", 12,    "A horsekiller, this sword is incredibly powerful, but also incredibly heavy.");
//Lances
ds_list_add(db, "Leafhead Lance",    sht_Lances,         0,  35,      "Bow",          "D", 0,     "A regular lance with a broad tip.");
ds_list_add(db, "War Lance",         sht_Lances,         1,  150,     "Bow",          "C", 1,     "A lance with a more narrow tip to fight in battles.");
ds_list_add(db, "Dragon Spear",      sht_Lances,         2,  2500,    "Bow",          "B", 6,     "A fiery lance that deals more damage when thrown.");
//Bows
ds_list_add(db, "Wooden Bow",        sht_Bows,           0,  35,      "Bow",          "D", 0,     "A flexible, springy bow.");
ds_list_add(db, "Rosewood Bow",      sht_Bows,           1,  35,      "Bow",          "D", 2,     "A stronger bow made out of better materials.");
ds_list_add(db, "Runic Bow",         sht_Bows,           2,  35,      "Bow",          "C", 4,     "A magically infused bow that fires magical arrows.");
ds_list_add(db, "Blackspire Bow",    sht_Bows,           3,  35,      "Bow",          "B", 6,     "A dark bow that fires cursed projectiles.");
//Claws
ds_list_add(db, "Steel Claws",       sht_Claws,          0,  100,     "Claw",         "D", 0,     "A set of long metal claws attached to leather gloves.");
//Daggers
ds_list_add(db, "Steel Daggers",     sht_Daggers,        0,  100,     "Dagger",       "D", 0,     "A pair of short metal daggers used for quick strikes.");
ds_list_add(db, "Rogue's Daggers",   sht_Daggers,        0,  100,     "Dagger",       "C", 2,     "Light daggers that allow you to poison your targets whilst sneaking.");
ds_list_add(db, "Royal Dagger",      sht_Daggers,        0,  1500,    "Dagger",       "C", -1,    "A pair of golden ceremonial daggers that inflict bleeding.");
ds_list_add(db, "Assassin Daggers",  sht_Daggers,        0,  100,     "Dagger",       "B", 4,     "Sharpened daggers that are superior to their roguish variants.");
//Scythes
ds_list_add(db, "Steel Scythe",      sht_Scythes,        0,  150,     "Scythe",       "D", 2,     "A straight steel battlescythe.");
ds_list_add(db, "Lychean Scythe",    sht_Scythes,        4,  250,     "Scythe",       "B", 8,     "A grim scythe decorated with skulls and bones.");
//Staves
ds_list_add(db, "Fire Staff",        sht_Staves,         0,  2500,    "Staff",        "C", 0,     "A wooden staff with a brass cap, tipped with a large ruby that feels hot to the touch.");
ds_list_add(db, "Ice Staff",         sht_Staves,         1,  2750,    "Staff",        "C", 0,     "A cold metal staff that has a sapphire tip. The gemstone chills the air around it.");
ds_list_add(db, "Lightning Staff",   sht_Staves,         2,  3000,    "Staff",        "C", 0,     "An copper staff that is tipped with a yellow topaz that jolts you as you touch it.");
ds_list_add(db, "Portal Staff",      sht_Staves,         3,  4500,    "Staff",        "B", 0,     "A wooden staff with two golden caps on either end. Rings of eldritch energy hover at the ends, around its rod.");
return db;
