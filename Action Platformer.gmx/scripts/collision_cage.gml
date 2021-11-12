///collision_cage(x1, y1, x2, y2, width, obj, prec, notme)
var x1, y1, x2, y2, w, obj, prec, notme;
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
w = argument[4];
obj = argument[5];
prec = argument[6];
notme = argument[7];
return collision_rectangle(x1, y1, x2, y2, obj, prec, notme) and not collision_rectangle(x1 + w, y1 + w, x2 - w, y2 - w, obj, prec, notme);
