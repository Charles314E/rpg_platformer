///create_item_text(origin, item)
if (not obj_GUI.GameFrozen) {
    origin = argument[0];
    item = argument[1];
    get_item(item);
    with (instance_create(origin.x, origin.y, txt_Item)) {
        Item = other.item;
        IconSprite = other.itemSprite;
        IconSubimage = other.itemSubimage;
        Origin = other.origin;
    }
}
