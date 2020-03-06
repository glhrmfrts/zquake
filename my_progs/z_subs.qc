/*
================
CenterPrintAll

Prints a centered message for every player connected
================
*/
void(string msg) CenterPrintAll =
{
	local entity client = world;
	while ((client = find(client, classname, "player")))
	{
		centerprint(client, msg);
	}
};

/*
===============
RandomBetween

Returns a random number between min and max inclusive.
===============
*/
float(float min, float max) RandomBetween =
{
	return min + (random() * (max - min));
};
