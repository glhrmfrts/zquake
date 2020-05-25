float g_monster_credits;
float g_monster_pup_chance;

void(float weapon) SetMonsterStats =
{
	g_monster_killed_time = time;
	g_monsters_killed = g_monsters_killed + 1;
	g_monster_pup_chance = self.wavenum + (0.001 * g_current_wave);
	g_monster_credits = self.credit;
	if (weapon == IT_AXE)
	{
		g_monster_credits = self.creditdifftime;
		g_monster_pup_chance += 0.05;
	}
	else if (weapon == IT_SHOTGUN)
	{
		g_monster_credits = self.creditdiff;
		g_monster_pup_chance += 0.02;
	}

	// Update counters
	if (self.zmonstertype == ZMONSTER_ZOMBIE)
	{
		g_zombies_killed = g_zombies_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_ZOMBIE)
	{
		g_zombies_killed = g_zombies_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_WEAK1)
	{
		g_weak1_killed = g_weak1_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_WEAK2)
	{
		g_weak2_killed = g_weak2_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_MID2)
	{
		g_mid2_killed = g_mid2_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_MID1)
	{
		g_mid1_killed = g_mid1_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_BOSS1)
	{
		g_boss1_killed = g_boss1_killed + 1;
	}
	else if (self.zmonstertype == ZMONSTER_BOSS2)
	{
		g_boss2_killed = g_boss2_killed + 1;
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