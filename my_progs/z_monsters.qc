float g_monster_credits;
float g_monster_pup_chance;

void(float weapon) SetMonsterStats =
{
	g_monster_killed_time = time;
	g_monsters_killed = g_monsters_killed + 1;

	if (self.zmonstertype == ZMONSTER_ZUMBI)
	{
		g_monster_pup_chance = 0.03;
		g_zombies_killed = g_zombies_killed + 1;

		if (weapon == IT_AXE)
			g_monster_credits = 5;
		else if (weapon == IT_SHOTGUN)
			g_monster_credits = 3;
		else
			g_monster_credits = 2;
	}
	else if (self.zmonstertype == ZMONSTER_ZUMBIK)
	{
		g_monster_pup_chance = 0.04;
		g_zombies_killed = g_zombies_killed + 1;

		if (weapon == IT_AXE)
			g_monster_credits = 6;
		else if (weapon == IT_SHOTGUN)
			g_monster_credits = 3;
		else
			g_monster_credits = 2;
	}
	else if (self.zmonstertype == ZMONSTER_DOG)
	{
		g_monster_pup_chance = 0.01;
		g_dogs_killed = g_dogs_killed + 1;

		if (weapon == IT_AXE)
			g_monster_credits = 3;
		else if (weapon == IT_SHOTGUN)
			g_monster_credits = 2;
		else
			g_monster_credits = 1;
	}
	else if (self.zmonstertype == ZMONSTER_SPIDER)
	{
		g_monster_pup_chance = 0.01;
		g_spiders_killed = g_spiders_killed + 1;

		if (weapon == IT_AXE)
			g_monster_credits = 4;
		else if (weapon == IT_SHOTGUN)
			g_monster_credits = 3;
		else
			g_monster_credits = 1;
	}
	else if (self.zmonstertype == ZMONSTER_BOIL)
	{
		g_monster_pup_chance = 0.03;
		g_boils_killed = g_boils_killed + 1;

		if (weapon == IT_AXE)
			g_monster_credits = 5;
		else if (weapon == IT_SHOTGUN)
			g_monster_credits = 3;
		else
			g_monster_credits = 2;
	}
	else if (self.zmonstertype == ZMONSTER_KNIGHT)
	{
		g_monster_pup_chance = 0.03;
		g_knights_killed = g_knights_killed + 1;

		if (weapon == IT_AXE)
			g_monster_credits = 6;
		else if (weapon == IT_SHOTGUN)
			g_monster_credits = 4;
		else
			g_monster_credits = 3;
	}
	else if (self.zmonstertype == ZMONSTER_DEMON)
	{
		g_monster_pup_chance = 0.06;
		g_demons_killed = g_demons_killed + 1;

		if (weapon == IT_AXE)
			g_monster_credits = 20;
		else if (weapon == IT_SHOTGUN)
			g_monster_credits = 15;
		else
			g_monster_credits = 10;
	}
};

void() ZMonsterDie =
{
	SetMonsterStats(self.enemy.weapon);

	if (self.enemy.classname == "player")
	{
		GiveCredits(self.enemy, g_monster_credits);
	}

	if (random() < g_monster_pup_chance)
		SpawnPowerup(self.origin);
};

float(float v) ZRunSpeedIncrease =
{
	// return speed increase for zombie based on current wave
	return v * (g_current_wave / 15.0);
};