
void() ZZumbiDie =
{
	if (self.enemy.classname == "player")
	{
		local float earned = 2;
		if (self.enemy.weapon == IT_AXE)
			earned = 5;
		else if (self.enemy.weapon == IT_SHOTGUN)
			earned = 3;

		GiveCredits(self.enemy, earned);
	}
	g_zombies_killed = g_zombies_killed + 1;

	if (random() < 0.03)
		SpawnPowerup(self.origin);
};

void () ZZumbiKnightDie =
{
	if (self.enemy.classname == "player")
	{
		local float earned = 2;
		if (self.enemy.weapon == IT_AXE)
			earned = 6;
		else if (self.enemy.weapon == IT_SHOTGUN)
			earned = 3;

		GiveCredits(self.enemy, earned);
	}
	g_zombies_killed = g_zombies_killed + 1;

    if (random() < 0.04)
		SpawnPowerup(self.origin);
};

void() ZDogDie =
{
    if (self.enemy.classname == "player")
	{
		local float earned = 1;
		if (self.enemy.weapon == IT_AXE)
			earned = 3;
		else if (self.enemy.weapon == IT_SHOTGUN)
			earned = 2;

		GiveCredits(self.enemy, earned);
	}
	g_dogs_killed = g_dogs_killed + 1;

    if (random() < 0.01)
		SpawnPowerup(self.origin);
};

void() ZSpiderDie =
{
    if (self.enemy.classname == "player")
	{
		local float earned = 2;
		if (self.enemy.weapon == IT_AXE)
			earned = 4;
		else if (self.enemy.weapon == IT_SHOTGUN)
			earned = 3;

		GiveCredits(self.enemy, earned);
	}
	g_spiders_killed = g_spiders_killed + 1;

    if (random() < 0.01)
		SpawnPowerup(self.origin);
};

void() ZKnightDie =
{
    if (self.enemy.classname == "player")
	{
		local float earned = 3;
		if (self.enemy.weapon == IT_AXE)
			earned = 6;
		else if (self.enemy.weapon == IT_SHOTGUN)
			earned = 4;

		GiveCredits(self.enemy, earned);
	}
	g_knights_killed = g_knights_killed + 1;

    if (random() < 0.03)
		SpawnPowerup(self.origin);
};

void() ZDemonDie =
{
    if (self.enemy.classname == "player")
	{
		local float earned = 10;
		if (self.enemy.weapon == IT_AXE)
			earned = 20;
		else if (self.enemy.weapon == IT_SHOTGUN)
			earned = 15;

		GiveCredits(self.enemy, earned);
	}
	g_demons_killed = g_demons_killed + 1;

	if (random() < 0.06)
		SpawnPowerup(self.origin);
};