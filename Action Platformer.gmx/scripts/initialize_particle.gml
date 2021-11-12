///initialize_particle(type, size, swell, r, g, b, grav, alpha, life, [sprite, animated?])
type = argument[0];
size = argument[1];
swell = argument[2];
r = argument[3];
g = argument[4];
b = argument[5];
grav = argument[6];
alpha = argument[7];
life = argument[8];
container = part_type_create();
if type = "sprite"
{
    sprite = argument[9];
    anim = argument[10];
    part_type_sprite(container, sprite, anim, true, false);
}
else
{
    part_type_shape(container, type);
}
part_type_size(container, size, size, swell, swell);
part_type_colour_rgb(container, r, r, g, g, b, b);
switch sign(grav)
{
    case -1: part_type_gravity(container, abs(grav), 90); break;
    case 1: part_type_gravity(container, abs(grav), 270); break;
}
part_type_alpha1(container, alpha);
part_type_life(container, room_speed * life, room_speed * life);
return container;
