const float EV_FLOAT = 2;

const float STAT_WAVENUM = 33;
const float STAT_CREDIT = 34;
const float STAT_CREDITDIFF = 35;
const float STAT_WAVEACTIVE = 36;

const float BASE_ZOMBIE_HEALTH = 30;
const float BASE_ZOMBIE_MINTIME = 5.0;
const float BASE_ZOMBIE_MAXTIME = 15.0;
const float BASE_ZOMBIE_MINCOUNT = 5;
const float BASE_ZOMBIE_MAXCOUNT = 10;
const float BASE_DOG_MINCOUNT = 1;
const float BASE_DOG_MAXCOUNT = 3;
const float BASE_SPIDER_MINCOUNT = 4;
const float BASE_SPIDER_MAXCOUNT = 12;
const float BASE_KNIGHT_MINCOUNT = 1;
const float BASE_KNIGHT_MAXCOUNT = 3;
const float BASE_DEMON_MINCOUNT = 1;
const float BASE_DEMON_MAXCOUNT = 2;

const float ITEM_WEAPON_SUPER_SHOTGUN = 0;
const float ITEM_WEAPON_NAILGUN = 1;
const float ITEM_WEAPON_RANDOM = 2;
const float ITEM_MEDKIT = 3;
const float ITEM_ARMOR_BASIC = 4;
const float ITEM_ARMOR_MEDIUM = 5;
const float ITEM_WEAPON_SUPER_NAILGUN = 6;
const float ITEM_SILVER_KEY = 7;
const float ITEM_GOLD_KEY = 8;

const float PRICE_WEAPON_SUPER_SHOTGUN = 90;
const float PRICE_WEAPON_NAILGUN = 100;
const float PRICE_WEAPON_SUPER_NAILGUN = 125;
const float PRICE_WEAPON_RANDOM = 80;
const float PRICE_AMMO_SHELLS = 45;
const float PRICE_AMMO_NAILS = 50;
const float PRICE_MEDKIT = 25;
const float PRICE_ARMOR_BASIC = 50;
const float PRICE_ARMOR_MEDIUM = 60;
const float PRICE_SILVER_KEY = 100;
const float PRICE_GOLD_KEY = 200;

// spawnflags for info_monster_spawn
const float MONSTERSPAWN_NOZOMBIE = 1;
const float MONSTERSPAWN_NODOG = 2;
const float MONSTERSPAWN_NOKNIGHT = 4;
const float MONSTERSPAWN_NODEMON = 8;
const float MONSTERSPAWN_NOSPIDER = 16;

const float RANDOM_WEAPON_GROUP = IT_GRENADE_LAUNCHER | IT_ROCKET_LAUNCHER | IT_LIGHTNING;

const float POWERUP_REMOVE_TIME = 60; // seconds

const float ZUMBI_MELEE_RANGE = 65;

// global variables about the current wave
float g_current_wave;
float g_wave_active;
float g_zombie_health;
float g_zombie_mintime;
float g_zombie_maxtime;
float g_zombies_to_spawn;
float g_zombies_spawned;
float g_zombies_killed;
float g_dogs_to_spawn;
float g_dogs_spawned;
float g_dogs_killed;
float g_spiders_to_spawn;
float g_spiders_spawned;
float g_spiders_killed;
float g_demons_to_spawn;
float g_demons_spawned;
float g_demons_killed;
float g_knights_to_spawn;
float g_knights_spawned;
float g_knights_killed;
float g_monsters_to_spawn;
float g_monsters_spawned;
float g_monsters_killed;
float g_monster_killed_time;

void(float num, float type, .__variant fld) clientstat = #232;

void(entity ent, float value) GiveCredits;

void(vector org) SpawnPowerup;

void() EndWaveCheat;