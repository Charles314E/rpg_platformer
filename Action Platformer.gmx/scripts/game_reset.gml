///game_reset()
game_restart();

with obj_Player
{ 
    statHealth = statMaxHealth;
    statMana = statMaxMana;
    statStamina = statMaxStamina;
    init = 60;
}

with obj_Inventory
{
    ds_grid_destroy(InventoryList);
    InventoryList = ds_grid_create(invW, invH);
    ds_grid_clear(InventoryList, 0);
}

with obj_WeaponSwitcher
{
    Weapon = 0;
    ds_list_destroy(WeaponsList);
    WeaponsList = ds_list_create();
    for (i = 0; i < 10; i += 1)
    {
        ds_list_add(WeaponsList, 0);
    }
}
