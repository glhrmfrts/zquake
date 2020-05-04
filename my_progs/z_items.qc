/*
===============
GiveCredits

Give credits to player
===============
*/
void(entity ent, float value) GiveCredits =
{
    ent.credit = ent.credit + value;
    ent.creditdiff = value;
    ent.creditdifftime = time + 3.0;
    bprint(ent.netname); bprint(" earned "); bprint(ftos(value)); bprint(" credits!\n");
};

/*
===============
TakeCredits

Take credits from player
===============
*/
void(entity ent, float value) TakeCredits =
{
    ent.credit = ent.credit - value;
    ent.creditdiff = -value;
    ent.creditdifftime = time + 3.0;
};

/*
===============
RefillWeapon

Give max ammo for given weapon
===============
*/
void(entity ent, float item) RefillWeapon =
{
    if (item & (IT_SHOTGUN | IT_SUPER_SHOTGUN))
    {
        ent.ammo_shells = 100;
    }
    else if (item & (IT_NAILGUN | IT_SUPER_NAILGUN))
    {
        ent.ammo_nails = 200;
    }
    else if (item & (IT_GRENADE_LAUNCHER | IT_ROCKET_LAUNCHER))
    {
        ent.ammo_rockets = 100;
    }
    else if (item & IT_LIGHTNING)
    {
        ent.ammo_cells = 200;
    }
};

/*
===============
GiveWeapon

Give weapon to player
===============
*/
void(entity ent, float item) GiveWeapon =
{
    if (!(ent.items & item))
    {
        ent.items = ent.items | item;
    }

    ent.weapon = item;
    RefillWeapon(ent, item);

    local entity this = self;
    self = ent;
    W_SetCurrentAmmo();
    self = this;
};

float g_powerup_needed;
float g_powerup_needed_time;

/*
===============
SpawnPowerup

Spawn a random powerup at an origin
===============
*/
void(vector org) SpawnPowerup =
{
    if (g_current_wave < 3) return;
    if (entity_pcontent(org)) return;

    local entity pup = spawn();
    pup.origin = org;

    local float r = random();
    local void() spawn_func;

    if (g_powerup_needed == IT_QUAD)
        r = 0.71;
    else if (g_powerup_needed == IT_INVULNERABILITY)
        r = 0.41;
    else if (g_powerup_needed == IT_SUPERHEALTH)
        r = 0.2;

    if (r > 0.70)
    {
        pup.classname = "item_artifact_super_damage";
        spawn_func = item_artifact_super_damage;
    }
    else if (r > 0.40)
    {
        pup.classname = "item_artifact_invulnerability";
        spawn_func = item_artifact_invulnerability;
    }
    else
    {
        pup.classname = "item_health";
        pup.spawnflags = H_MEGA;
        spawn_func = item_health;
    }

    local entity this = self;
    self = pup;
    spawn_func();
    self.estate_use();
    self = this;

    pup.think = SUB_Remove;
    pup.nextthink = time + POWERUP_REMOVE_TIME;

    g_powerup_needed = 0;
};

/*
===============
IsPowerupNeeded

Returns whether or not a powerup is extremely needed by a player, with 50% chance.
===============
*/
float() IsPowerupNeeded =
{
    local float r = random();
    if (r < 0.3) return FALSE;

    // Wait for the timer in case it's not the first time a needed powerup spawned
    if (g_powerup_needed_time > 0 && g_powerup_needed_time < time) return FALSE;

    local entity p = world;
    while ((p = find(p, classname, "player")))
    {
        if (p.health > 0 && p.health < 10)
        {
            r = random();
            if (r < 0.5)
                g_powerup_needed = IT_SUPERHEALTH;
            else if (!(p.items & IT_INVULNERABILITY))
                g_powerup_needed = IT_INVULNERABILITY;

            g_powerup_needed_time = time + 120;
            return TRUE;
        }
    }

    return FALSE;
};

/*
===============
BuyWeaponOrAmmo

Buy a weapon if player doesn't have that weapon yet, otherwise refills ammo
===============
*/
void(entity act, float weapon, float price, float priceammo) BuyWeaponOrAmmo =
{
    if ((act.items & weapon) && act.credit >= priceammo)
    {
        TakeCredits(act, priceammo);
        sound (act, CHAN_ITEM, "weapons/lock4.wav", 1, ATTN_NORM);
    }
    else if (!(act.items & weapon) && act.credit >= price)
    {
        TakeCredits(act, price);
        sound (act, CHAN_ITEM, "weapons/pkup.wav", 1, ATTN_NORM);
    }
    else
    {
        centerprint(act, "Not enough cash!");
        return;
    }
    
    GiveWeapon(act, weapon);
    stuffcmd (act, "bf\n");
    self.state = self.state + 1;
};

float (entity e, float healamount, float ignore, float max_health) T_Heal2 =
{
	if (e.health <= 0)
		return 0;
	if ((!ignore) && (e.health >= max_health))
		return 0;
	healamount = ceil(healamount);

	e.health = e.health + healamount;
	if ((!ignore) && (e.health >= max_health))
		e.health = max_health;

	if (e.health > 250)
		e.health = 250;
	return 1;
};

void() buy_item_use =
{
    local entity act = activator;

    if (self.count != -1 && self.state >= self.count)
    {
        centerprint(act, strcat(self.message, "\n"));
        return;
    }

    if (self.item == ITEM_WEAPON_SUPER_SHOTGUN)
    {
        BuyWeaponOrAmmo(act, IT_SUPER_SHOTGUN, PRICE_WEAPON_SUPER_SHOTGUN, PRICE_AMMO_SHELLS);
    }
    else if (self.item == ITEM_WEAPON_NAILGUN)
    {
        BuyWeaponOrAmmo(act, IT_NAILGUN, PRICE_WEAPON_NAILGUN, PRICE_AMMO_NAILS);
    }
    else if (self.item == ITEM_WEAPON_SUPER_NAILGUN)
    {
        BuyWeaponOrAmmo(act, IT_SUPER_NAILGUN, PRICE_WEAPON_SUPER_NAILGUN, PRICE_AMMO_NAILS);
    }
    else if (self.item == ITEM_WEAPON_RANDOM)
    {
        if (act.credit < PRICE_WEAPON_RANDOM)
        {
            centerprint(act, "Not enough cash!");
            return;
        }

        // give back previous weapon
        if (act.items & RANDOM_WEAPON_GROUP)
        {
            act.items = act.items - (act.items & RANDOM_WEAPON_GROUP);
        }

        local float newweapon = self.count;
        while (newweapon == self.count)
        {
            local float r = random();
            if (r > 0.66)
            {
                newweapon = IT_GRENADE_LAUNCHER;
            }
            else if (r > 0.33)
            {
                newweapon = IT_ROCKET_LAUNCHER;
            }
            else
            {
                newweapon = IT_LIGHTNING;
            }
        }
        self.count = newweapon;

        GiveWeapon(act, newweapon);
        TakeCredits(act, PRICE_WEAPON_RANDOM);
        sound (act, CHAN_ITEM, "weapons/pkup.wav", 1, ATTN_NORM);
        stuffcmd (act, "bf\n");
        self.state = self.state + 1;
    }
    else if (self.item == ITEM_MEDKIT)
    {
        if (act.credit < PRICE_MEDKIT)
        {
            centerprint(act, "Not enough cash!");
            return;
        }

        local	float amount;
        local	string	s;
        amount = 25;
        if (act.classname != "player")
            return;

        if (T_Heal2(act, amount, 0, 100) == 0)
            return;

        sprint(act, "You receive ");
        s = ftos(amount);
        sprint(act, s);
        sprint(act, " health\n");

    // health touch sound
        sound(act, CHAN_ITEM, "items/health1.wav", 1, ATTN_NORM);

        stuffcmd (act, "bf\n");

        TakeCredits(act, PRICE_MEDKIT);
        self.state = self.state + 1;
    }
    else if (self.item == ITEM_SILVER_KEY || self.item == ITEM_GOLD_KEY)
    {
        local float price = PRICE_SILVER_KEY;
        if (self.item == ITEM_GOLD_KEY) price = PRICE_GOLD_KEY;

        if (act.credit < PRICE_SILVER_KEY)
        {
            centerprint(act, "Not enough cash!");
            return;
        }

        // Find reference item
        local entity ref = find(world, targetname, self.target);
        if ( act.items & ref.items ) return;
        
        sprint (act, "You got the ");
        sprint (act, ref.netname);
        sprint (act,"\n");
        if (ref.noise != SOUND_EMPTY) 
            sound (act, CHAN_ITEM, ref.noise, 1, ATTN_NORM);
        stuffcmd (act, "bf\n");
        
        // Add silver/gold key to player inventory
        act.items = act.items | ref.items;

        TakeCredits(act, price);
        self.state = self.state + 1;
    }
};

/*QUAKED info_buy_item
Buys an item when used
-------- KEYS --------
item        : The item available to buy
count       : Number of times that players can buy this item (default = -1)
message     : Message to display after players bought this [count] times
targetname  : Target name
*/
void() info_buy_item =
{
    if (self.item == ITEM_MEDKIT)
    {
        precache_sound ("items/health1.wav");
    }
    else
    {
        precache_sound ("weapons/pkup.wav");
        precache_sound ("weapons/lock4.wav");
    }

    self.solid = SOLID_NOT;
    self.movetype = MOVETYPE_NONE;
    self.use = buy_item_use;
    if (!self.count)
        self.count = -1;
    if (!self.message)
        self.message = "You can't buy this anymore";
};