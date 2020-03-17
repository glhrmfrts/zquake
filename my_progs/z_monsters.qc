float g_monster_credits;
float g_monster_pup_chance;

void(float weapon) SetMonsterStats =
{
	g_monster_killed_time = time;
	g_monsters_killed = g_monsters_killed + 1;
	g_monster_pup_chance = self.wavenum;
	g_monster_credits = self.credit;
	if (weapon == IT_AXE)
		g_monster_credits = self.creditdifftime;
	else if (weapon == IT_SHOTGUN)
		g_monster_credits = self.creditdiff;

	// Update counters
	if (self.zmonstertype == ZMONSTER_ZUMBI)
	{
		g_zombies_killed = g_zombies_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_ZUMBIK)
	{
		g_zombies_killed = g_zombies_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_DOG)
	{
		g_dogs_killed = g_dogs_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_SPIDER)
	{
		g_spiders_killed = g_spiders_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_BOIL)
	{
		g_boils_killed = g_boils_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_KNIGHT)
	{
		g_knights_killed = g_knights_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_DEMON)
	{
		g_demons_killed = g_demons_killed + 1;
	}
};

void() ZMonsterDie =
{
	SetMonsterStats(self.enemy.weapon);

	if (self.enemy.classname == "player")
	{
		GiveCredits(self.enemy, g_monster_credits);
	}

	if (random() < g_monster_pup_chance || IsPowerupNeeded())
		SpawnPowerup(self.origin);
};

float(float v) ZRunSpeedIncrease =
{
	// return speed increase for zombie based on current wave
	return v * (g_current_wave / 15.0);
};