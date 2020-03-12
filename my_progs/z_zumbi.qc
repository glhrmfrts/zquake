/*==============================================================================
ZOMBIE
==============================================================================*/
$cd id1/models/zombie

$origin	0 0 24

$base base
$skin skin

$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7 stand8
$frame stand9 stand10 stand11 stand12 stand13 stand14 stand15

$frame walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 walk9 walk10 walk11
$frame walk12 walk13 walk14 walk15 walk16 walk17 walk18 walk19

$frame run1 run2 run3 run4 run5 run6 run7 run8 run9 run10 run11 run12
$frame run13 run14 run15 run16 run17 run18

$frame atta1 atta2 atta3 atta4 atta5 atta6 atta7 atta8 atta9 atta10 atta11
$frame atta12 atta13

$frame attb1 attb2 attb3 attb4 attb5 attb6 attb7 attb8 attb9 attb10 attb11
$frame attb12 attb13 attb14

$frame attc1 attc2 attc3 attc4 attc5 attc6 attc7 attc8 attc9 attc10 attc11
$frame attc12

$frame paina1 paina2 paina3 paina4 paina5 paina6 paina7 paina8 paina9 paina10
$frame paina11 paina12

$frame painb1 painb2 painb3 painb4 painb5 painb6 painb7 painb8 painb9 painb10
$frame painb11 painb12 painb13 painb14 painb15 painb16 painb17 painb18 painb19
$frame painb20 painb21 painb22 painb23 painb24 painb25 painb26 painb27 painb28

$frame painc1 painc2 painc3 painc4 painc5 painc6 painc7 painc8 painc9 painc10
$frame painc11 painc12 painc13 painc14 painc15 painc16 painc17 painc18

$frame paind1 paind2 paind3 paind4 paind5 paind6 paind7 paind8 paind9 paind10
$frame paind11 paind12 paind13

$frame paine1 paine2 paine3 paine4 paine5 paine6 paine7 paine8 paine9 paine10
$frame paine11 paine12 paine13 paine14 paine15 paine16 paine17 paine18 paine19
$frame paine20 paine21 paine22 paine23 paine24 paine25 paine26 paine27 paine28
$frame paine29 paine30

$frame cruc_1 cruc_2 cruc_3 cruc_4 cruc_5 cruc_6

void(float type) zumbi_sound;
void(float frameno) zumbi_onground;

//=============================================================================
void() zumbi_stand1	=[	$stand1,		zumbi_stand2	] {
	zumbi_sound(2); self.solid = SOLID_SLIDEBOX; ai_stand();
};
void() zumbi_stand2	=[	$stand2,		zumbi_stand3	] {ai_stand();};
void() zumbi_stand3	=[	$stand3,		zumbi_stand4	] {ai_stand();};
void() zumbi_stand4	=[	$stand4,		zumbi_stand5	] {ai_stand();};
void() zumbi_stand5	=[	$stand5,		zumbi_stand6	] {ai_stand();};
void() zumbi_stand6	=[	$stand6,		zumbi_stand7	] {ai_stand();};
void() zumbi_stand7	=[	$stand7,		zumbi_stand8	] {ai_stand();};
void() zumbi_stand8	=[	$stand8,		zumbi_stand9	] {ai_stand();};
void() zumbi_stand9	=[	$stand9,		zumbi_stand10	] {ai_stand();};
void() zumbi_stand10	=[	$stand10,		zumbi_stand11	] {ai_stand();};
void() zumbi_stand11	=[	$stand11,		zumbi_stand12	] {ai_stand();};
void() zumbi_stand12	=[	$stand12,		zumbi_stand13	] {ai_stand();};
void() zumbi_stand13	=[	$stand13,		zumbi_stand14	] {ai_stand();};
void() zumbi_stand14	=[	$stand14,		zumbi_stand15	] {ai_stand();};
void() zumbi_stand15	=[	$stand15,		zumbi_stand1	] {ai_stand();};

//============================================================================
void() zumbi_walk1		=[	$walk1,		zumbi_walk2	] {
	self.inpain = 0; self.solid = SOLID_SLIDEBOX; ai_walk(0);
};
void() zumbi_walk2		=[	$walk2,		zumbi_walk3	] {monster_footstep(TRUE); ai_walk(2);};
void() zumbi_walk3		=[	$walk3,		zumbi_walk4	] {ai_walk(3);};
void() zumbi_walk4		=[	$walk4,		zumbi_walk5	] {ai_walk(2);};
void() zumbi_walk5		=[	$walk5,		zumbi_walk6	] {ai_walk(1);};
void() zumbi_walk6		=[	$walk6,		zumbi_walk7	] {ai_walk(0);};
void() zumbi_walk7		=[	$walk7,		zumbi_walk8	] {ai_walk(0);};
void() zumbi_walk8		=[	$walk8,		zumbi_walk9	] {ai_walk(0);};
void() zumbi_walk9		=[	$walk9,		zumbi_walk10	] {ai_walk(0);};
void() zumbi_walk10	=[	$walk10,	zumbi_walk11	] {ai_walk(0);};
void() zumbi_walk11	=[	$walk11,	zumbi_walk12	] {ai_walk(2);};
void() zumbi_walk12	=[	$walk12,	zumbi_walk13	] {monster_footstep(FALSE); ai_walk(2);};
void() zumbi_walk13	=[	$walk13,	zumbi_walk14	] {ai_walk(1);};
void() zumbi_walk14	=[	$walk14,	zumbi_walk15	] {ai_walk(0);};
void() zumbi_walk15	=[	$walk15,	zumbi_walk16	] {ai_walk(0);};
void() zumbi_walk16	=[	$walk16,	zumbi_walk17	] {ai_walk(0);};
void() zumbi_walk17	=[	$walk17,	zumbi_walk18	] {ai_walk(0);};
void() zumbi_walk18	=[	$walk18,	zumbi_walk19	] {ai_walk(0);};
void() zumbi_walk19	=[	$walk19,	zumbi_walk1	] {zumbi_sound(2);};

//============================================================================

void() zumbi_run1		=[	$run1,		zumbi_run2	] {
	self.inpain = 0; self.solid = SOLID_SLIDEBOX; ai_run(1);
};
void() zumbi_run2		=[	$run2,		zumbi_run3	] {ai_run(1 + ZRunSpeedIncrease(1));};
void() zumbi_run3		=[	$run3,		zumbi_run4	] {ai_run(0);};
void() zumbi_run4		=[	$run4,		zumbi_run5	] {ai_run(1 + ZRunSpeedIncrease(1));};
void() zumbi_run5		=[	$run5,		zumbi_run6	] {ai_run(2 + ZRunSpeedIncrease(2));};
void() zumbi_run6		=[	$run6,		zumbi_run7	] {ai_run(3 + ZRunSpeedIncrease(3));};
void() zumbi_run7		=[	$run7,		zumbi_run8	] {ai_run(4 + ZRunSpeedIncrease(4));};
void() zumbi_run8		=[	$run8,		zumbi_run9	] {ai_run(4 + ZRunSpeedIncrease(4));};
void() zumbi_run9		=[	$run9,		zumbi_run10] {monster_footstep(FALSE); ai_run(2 + ZRunSpeedIncrease(2));};
void() zumbi_run10		=[	$run10,		zumbi_run11] {ai_run(0);};
void() zumbi_run11		=[	$run11,		zumbi_run12] {ai_run(0);};
void() zumbi_run12		=[	$run12,		zumbi_run13] {ai_run(0);};
void() zumbi_run13		=[	$run13,		zumbi_run14] {ai_run(2 + ZRunSpeedIncrease(2));};
void() zumbi_run14		=[	$run14,		zumbi_run15] {ai_run(4 + ZRunSpeedIncrease(4));};
void() zumbi_run15		=[	$run15,		zumbi_run16] {ai_run(6 + ZRunSpeedIncrease(6));};
void() zumbi_run16		=[	$run16,		zumbi_run17] {ai_run(7 + ZRunSpeedIncrease(7));};
void() zumbi_run17		=[	$run17,		zumbi_run18] {monster_footstep(FALSE); ai_run(3 + ZRunSpeedIncrease(3));};
void() zumbi_run18		=[	$run18,		zumbi_run1	] {zumbi_sound(3);	ai_run(8 + ZRunSpeedIncrease(8)); };

void() ZumbiCheckAttack =
{
	if (enemy_range == RANGE_MELEE)
	{
		local vector delta = self.enemy.origin - self.origin;
		if (vlen(delta) <= ZUMBI_MELEE_RANGE)
		{
			self.attack_state = AS_MELEE;
		}
	}

	if (self.zombie_health)
		CheckAttack();
};

//======================================================================
// Zumbi Range Attack
//======================================================================
void(vector st) ZumbiThrowFlesh =
{
	local vector org, dir, ang, avel;

	if (self.health < 0) return;
	
	// Throw the flesh missle from the hand above the head
	makevectors (self.angles);
	org = self.origin + attack_vector(st);

	// Is Z aware enabled (AI track player much better)
	if ( query_configflag(SVR_ZAWARE) || self.no_zaware ) {
		dir = normalize(self.enemy.origin - org);
		dir = dir * SPEED_ZOMBFLESH;
		dir_z = ELEV_ZAXIS;
	}
	else {
		// One final angle adjustment (based on actual projectile origin)
		self.attack_speed = SPEED_ZOMBFLESH + (skill * SPEED_ZOMBIESKILL);
		self.attack_elev = SUB_Elevation(self.attack_elev, org, self.enemy.origin, self.attack_speed);
		ang = vectoangles(self.enemy.origin - org);
		ang_x = -self.attack_elev;
		makevectors (ang);
 		dir = v_forward * self.attack_speed;
	}

	avel = vecrand(100,200,FALSE);
	Launch_Grenade(org, dir, avel, CT_PROJ_FLESH);
};

/*
================
ZumbiMeleeAttack
================
*/
void() ZumbiMeleeAttack =
{
	local	float	ldmg;
	local vector	delta;

	ai_face ();
	walkmove (self.ideal_yaw, 12);	// allow a little closing

	delta = self.enemy.origin - self.origin;

	if (vlen(delta) > ZUMBI_MELEE_RANGE)
		return;
	if (!CanDamage (self.enemy, self))
		return;

	sound (self, CHAN_WEAPON, "demon/dhit2.wav", 1, ATTN_NORM);
	ldmg = 10 + 5*random();
	T_Damage (self.enemy, self, self, ldmg);

	//makevectors (self.angles);
	SpawnMeatSpray (self, self.enemy, 200);
};

// melee attack
void()	zumbi_matta1	=[	$atta1,		zumbi_matta7	] {ai_face();};
void()	zumbi_matta7	=[	$atta7,		zumbi_matta8	] {ai_face();};
void()	zumbi_matta8	=[	$atta8,		zumbi_matta9	] {ai_face();};
void()	zumbi_matta9	=[	$atta9,		zumbi_matta10] {ai_face();};
void()	zumbi_matta10	=[	$atta10,		zumbi_matta11] {ai_face();};
void()	zumbi_matta11	=[	$atta11,		zumbi_matta12] {ai_face();};
void()	zumbi_matta12	=[	$atta12,		zumbi_matta13] {ai_face();};
void()	zumbi_matta13	=[	$atta13,		zumbi_run1] {ai_face();ZumbiMeleeAttack();};

void() zumbi_melee =
{
    zumbi_matta1();
};


//----------------------------------------------------------------------
void() zumbi_atta1		=[	$atta1,		zumbi_atta2	] {ai_face();};
void() zumbi_atta2		=[	$atta2,		zumbi_atta3	] {ai_face();};
void() zumbi_atta3		=[	$atta3,		zumbi_atta4	] {ai_face();};
void() zumbi_atta4		=[	$atta4,		zumbi_atta5	] {ai_face();};
void() zumbi_atta5		=[	$atta5,		zumbi_atta6	] {ai_face();};
void() zumbi_atta6		=[	$atta6,		zumbi_atta7	] {ai_face();};
void() zumbi_atta7		=[	$atta7,		zumbi_atta8	] {ai_face();};
void() zumbi_atta8		=[	$atta8,		zumbi_atta9	] {ai_face();};
void() zumbi_atta9		=[	$atta9,		zumbi_atta10	] {ai_face();};
void() zumbi_atta10	=[	$atta10,	zumbi_atta11	] {ai_face();
	self.attack_speed = SPEED_ZOMBFLESH + (skill * SPEED_ZOMBIESKILL);
	self.attack_elev = SUB_Elevation(ELEV_DEFAULT, self.origin, self.enemy.origin, self.attack_speed); };
void() zumbi_atta11	=[	$atta11,	zumbi_atta12	] {ai_face();
	self.attack_speed = SPEED_ZOMBFLESH + (skill * SPEED_ZOMBIESKILL);
	self.attack_elev = SUB_Elevation(self.attack_elev, self.origin, self.enemy.origin, self.attack_speed); };
void() zumbi_atta12	=[	$atta12,	zumbi_atta13	] {ai_face();
	ZumbiThrowFlesh('8 12 28');};
void() zumbi_atta13	=[	$atta13,	zumbi_run1	] {};

//----------------------------------------------------------------------
void() zumbi_attb1		=[	$attb1,		zumbi_attb2	] {ai_face();};
void() zumbi_attb2		=[	$attb2,		zumbi_attb3	] {ai_face();};
void() zumbi_attb3		=[	$attb3,		zumbi_attb4	] {ai_face();};
void() zumbi_attb4		=[	$attb4,		zumbi_attb5	] {ai_face();};
void() zumbi_attb5		=[	$attb5,		zumbi_attb6	] {ai_face();};
void() zumbi_attb6		=[	$attb6,		zumbi_attb7	] {ai_face();};
void() zumbi_attb7		=[	$attb7,		zumbi_attb8	] {ai_face();};
void() zumbi_attb8		=[	$attb8,		zumbi_attb9	] {ai_face();};
void() zumbi_attb9		=[	$attb9,		zumbi_attb10	] {ai_face();};
void() zumbi_attb10	=[	$attb10,	zumbi_attb11	] {ai_face();};
void() zumbi_attb11	=[	$attb11,	zumbi_attb12	] {ai_face();
	self.attack_elev = SUB_Elevation(ELEV_DEFAULT, self.origin, self.enemy.origin, SPEED_ZOMBFLESH); };
void() zumbi_attb12	=[	$attb12,	zumbi_attb13	] {ai_face();
	self.attack_elev = SUB_Elevation(self.attack_elev, self.origin, self.enemy.origin, SPEED_ZOMBFLESH); };
void() zumbi_attb13	=[	$attb13,	zumbi_attb14	] {ai_face();
	ZumbiThrowFlesh('6 -6 26');};
void() zumbi_attb14	=[	$attb13,	zumbi_run1	] {};

//----------------------------------------------------------------------
void() zumbi_attc1		=[	$attc1,		zumbi_attc2	] {ai_face();};
void() zumbi_attc2		=[	$attc2,		zumbi_attc3	] {ai_face();};
void() zumbi_attc3		=[	$attc3,		zumbi_attc4	] {ai_face();};
void() zumbi_attc4		=[	$attc4,		zumbi_attc5	] {ai_face();};
void() zumbi_attc5		=[	$attc5,		zumbi_attc6	] {ai_face();};
void() zumbi_attc6		=[	$attc6,		zumbi_attc7	] {ai_face();};
void() zumbi_attc7		=[	$attc7,		zumbi_attc8	] {ai_face();};
void() zumbi_attc8		=[	$attc8,		zumbi_attc9	] {ai_face();};
void() zumbi_attc9		=[	$attc9,		zumbi_attc10	] {ai_face();
	self.attack_elev = SUB_Elevation(ELEV_DEFAULT, self.origin, self.enemy.origin, SPEED_ZOMBFLESH); };
void() zumbi_attc10	=[	$attc10,	zumbi_attc11	] {ai_face();
	self.attack_elev = SUB_Elevation(self.attack_elev, self.origin, self.enemy.origin, SPEED_ZOMBFLESH); };
void() zumbi_attc11	=[	$attc11,	zumbi_attc12	] {ai_face();
	ZumbiThrowFlesh('18 13 24');};
void() zumbi_attc12	=[	$attc12,	zumbi_run1		] {};

//----------------------------------------------------------------------
void() zumbi_missile =
{
	if (!self.zombie_health) return;

	self.lip = self.meleeattack;
	// Don't pick the same attack twice in a row
	while (self.lip == self.meleeattack) {
		self.lip = rint(random()*3);
	}

	self.meleeattack = self.lip;
	if (self.meleeattack == 1) zumbi_atta1 ();
	else if (self.meleeattack == 2) zumbi_attb1 ();
	else zumbi_attc1 ();
};

//======================================================================
// PAIN
//======================================================================
void() zumbi_paina1	=[	$paina1,	zumbi_paina2	] {zumbi_sound(4);};
void() zumbi_paina2	=[	$paina2,	zumbi_paina3	] {ai_painforward(3);};
void() zumbi_paina3	=[	$paina3,	zumbi_paina4	] {ai_painforward(1);};
void() zumbi_paina4	=[	$paina4,	zumbi_paina5	] {ai_pain(1);};
void() zumbi_paina5	=[	$paina5,	zumbi_paina6	] {ai_pain(3);};
void() zumbi_paina6	=[	$paina6,	zumbi_paina7	] {ai_pain(1);};
void() zumbi_paina7	=[	$paina7,	zumbi_paina8	] {};
void() zumbi_paina8	=[	$paina8,	zumbi_paina9	] {};
void() zumbi_paina9	=[	$paina9,	zumbi_paina10	] {};
void() zumbi_paina10	=[	$paina10,	zumbi_paina11	] {};
void() zumbi_paina11	=[	$paina11,	zumbi_paina12	] {};
void() zumbi_paina12	=[	$paina12,	zumbi_run1		] {};

//----------------------------------------------------------------------
void() zumbi_painc1	=[	$painc1,	zumbi_painc2	] {zumbi_sound(4);};
void() zumbi_painc2	=[	$painc2,	zumbi_painc3	] {};
void() zumbi_painc3	=[	$painc3,	zumbi_painc4	] {ai_pain(3);};
void() zumbi_painc4	=[	$painc4,	zumbi_painc5	] {ai_pain(1);};
void() zumbi_painc5	=[	$painc5,	zumbi_painc6	] {};
void() zumbi_painc6	=[	$painc6,	zumbi_painc7	] {};
void() zumbi_painc7	=[	$painc7,	zumbi_painc8	] {};
void() zumbi_painc8	=[	$painc8,	zumbi_painc9	] {};
void() zumbi_painc9	=[	$painc9,	zumbi_painc10	] {};
void() zumbi_painc10	=[	$painc10,	zumbi_painc11	] {};
void() zumbi_painc11	=[	$painc11,	zumbi_painc12	] {ai_painforward(1);};
void() zumbi_painc12	=[	$painc12,	zumbi_painc13	] {ai_painforward(1);};
void() zumbi_painc13	=[	$painc13,	zumbi_painc14	] {};
void() zumbi_painc14	=[	$painc14,	zumbi_painc15	] {};
void() zumbi_painc15	=[	$painc15,	zumbi_painc16	] {};
void() zumbi_painc16	=[	$painc16,	zumbi_painc17	] {};
void() zumbi_painc17	=[	$painc17,	zumbi_painc18	] {};
void() zumbi_painc18	=[	$painc18,	zumbi_run1	] {};

//----------------------------------------------------------------------
void() zumbi_paind1	=[	$paind1,	zumbi_paind2	] {zumbi_sound(4);};
void() zumbi_paind2	=[	$paind2,	zumbi_paind3	] {};
void() zumbi_paind3	=[	$paind3,	zumbi_paind4	] {};
void() zumbi_paind4	=[	$paind4,	zumbi_paind5	] {};
void() zumbi_paind5	=[	$paind5,	zumbi_paind6	] {};
void() zumbi_paind6	=[	$paind6,	zumbi_paind7	] {};
void() zumbi_paind7	=[	$paind7,	zumbi_paind8	] {};
void() zumbi_paind8	=[	$paind8,	zumbi_paind9	] {};
void() zumbi_paind9	=[	$paind9,	zumbi_paind10	] {ai_pain(1);};
void() zumbi_paind10	=[	$paind10,	zumbi_paind11	] {};
void() zumbi_paind11	=[	$paind11,	zumbi_paind12	] {};
void() zumbi_paind12	=[	$paind12,	zumbi_paind13	] {};
void() zumbi_paind13	=[	$paind13,	zumbi_run1	] {};

//----------------------------------------------------------------------
// Fall down - B : random pain, E : large amount of damage
//----------------------------------------------------------------------
void() zumbi_painb1	=[	$painb1,	zumbi_painb2	] {self.inpain = 2;};
void() zumbi_painb2	=[	$painb2,	zumbi_painb3	] {ai_pain(2);};
void() zumbi_painb3	=[	$painb3,	zumbi_painb4	] {ai_pain(8);};
void() zumbi_painb4	=[	$painb4,	zumbi_painb5	] {ai_pain(6);};
void() zumbi_painb5	=[	$painb5,	zumbi_painb6	] {ai_pain(2);};
void() zumbi_painb6	=[	$painb6,	zumbi_painb7	] {};
void() zumbi_painb7	=[	$painb7,	zumbi_painb8	] {zumbi_sound(5);};
void() zumbi_painb8	=[	$painb8,	zumbi_painb9	] {self.solid = SOLID_NOT;};
void() zumbi_painb9	=[	$painb9,	zumbi_painb9	] {
	zumbi_onground(MONAI_ZOMBIEUPB);};

// Start of get up sequence
void() zumbi_painb10	=[	$painb10,	zumbi_painb11	] {};
void() zumbi_painb11	=[	$painb11,	zumbi_painb12	] {};
void() zumbi_painb12	=[	$painb12,	zumbi_painb13	] {};
void() zumbi_painb13	=[	$painb13,	zumbi_painb14	] {};
void() zumbi_painb14	=[	$painb14,	zumbi_painb15	] {};
void() zumbi_painb15	=[	$painb15,	zumbi_painb16	] {};
void() zumbi_painb16	=[	$painb16,	zumbi_painb17	] {};
void() zumbi_painb17	=[	$painb17,	zumbi_painb18	] {};
void() zumbi_painb18	=[	$painb18,	zumbi_painb19	] {};
void() zumbi_painb19	=[	$painb19,	zumbi_painb20	] {};
void() zumbi_painb20	=[	$painb20,	zumbi_painb21	] {};
void() zumbi_painb21	=[	$painb21,	zumbi_painb22	] {};
void() zumbi_painb22	=[	$painb22,	zumbi_painb23	] {};
void() zumbi_painb23	=[	$painb23,	zumbi_painb24	] {};
void() zumbi_painb24	=[	$painb24,	zumbi_painb25	] {};
void() zumbi_painb25	=[	$painb25,	zumbi_painb26	] {monster_footstep(FALSE); ai_painforward(1);};
void() zumbi_painb26	=[	$painb26,	zumbi_painb27	] {};
void() zumbi_painb27	=[	$painb27,	zumbi_painb28	] {};
void() zumbi_painb28	=[	$painb28,	zumbi_run1		] {
	// If getting up for the first time (onfloor) check for targets
	if (self.spawnflags & MON_ONFLOOR) {
		self.spawnflags = self.spawnflags - MON_ONFLOOR;
		monster_targets();
	}
};

//----------------------------------------------------------------------
void() zumbi_paine1	=[	$paine1,	zumbi_paine2	] {self.inpain = 2;};
void() zumbi_paine2	=[	$paine2,	zumbi_paine3	] {ai_pain(8);};
void() zumbi_paine3	=[	$paine3,	zumbi_paine4	] {ai_pain(5);};
void() zumbi_paine4	=[	$paine4,	zumbi_paine5	] {ai_pain(3);};
void() zumbi_paine5	=[	$paine5,	zumbi_paine6	] {ai_pain(1);};
void() zumbi_paine6	=[	$paine6,	zumbi_paine7	] {ai_pain(2);};
void() zumbi_paine7	=[	$paine7,	zumbi_paine8	] {ai_pain(1);};
void() zumbi_paine8	=[	$paine8,	zumbi_paine9	] {ai_pain(1);};
void() zumbi_paine9	=[	$paine9,	zumbi_paine10	] {ai_pain(2);};
void() zumbi_paine10	=[	$paine10,	zumbi_paine11	] {zumbi_sound(5);};
void() zumbi_paine11	=[	$paine11,	zumbi_paine12	] {self.solid = SOLID_NOT;};
void() zumbi_paine12	=[	$paine12,	zumbi_paine12	] {
	zumbi_onground(MONAI_ZOMBIEUPE);};

// Start of get up sequence
void() zumbi_paine13	=[	$paine13,	zumbi_paine14	] {};
void() zumbi_paine14	=[	$paine14,	zumbi_paine15	] {};
void() zumbi_paine15	=[	$paine15,	zumbi_paine16	] {};
void() zumbi_paine16	=[	$paine16,	zumbi_paine17	] {};
void() zumbi_paine17	=[	$paine17,	zumbi_paine18	] {};
void() zumbi_paine18	=[	$paine18,	zumbi_paine19	] {};
void() zumbi_paine19	=[	$paine19,	zumbi_paine20	] {};
void() zumbi_paine20	=[	$paine20,	zumbi_paine21	] {};
void() zumbi_paine21	=[	$paine21,	zumbi_paine22	] {};
void() zumbi_paine22	=[	$paine22,	zumbi_paine23	] {};
void() zumbi_paine23	=[	$paine23,	zumbi_paine24	] {};
void() zumbi_paine24	=[	$paine24,	zumbi_paine25	] {monster_footstep(FALSE);};
void() zumbi_paine25	=[	$paine25,	zumbi_paine26	] {ai_painforward(5);};
void() zumbi_paine26	=[	$paine26,	zumbi_paine27	] {ai_painforward(3);};
void() zumbi_paine27	=[	$paine27,	zumbi_paine28	] {ai_painforward(1);};
void() zumbi_paine28	=[	$paine28,	zumbi_paine29	] {ai_pain(1);};
void() zumbi_paine29	=[	$paine29,	zumbi_paine30	] {};
void() zumbi_paine30	=[	$paine30,	zumbi_run1		] {
	// If getting up for the first time (onfloor) check for targets
	if (self.spawnflags & MON_ONFLOOR) {
		self.spawnflags = self.spawnflags - MON_ONFLOOR;
		monster_targets();
	}
};

/*======================================================================
 ZOMBIE PAIN
 * All damage must come through pain function to reset health
 * Be careful blocking zombie pain function with pain_finished
 * zombies react in 2 ways, minor pain (a,c,d) and full knockdown (b,e)
======================================================================*/
void(entity inflictor, entity attacker, float take) zumbi_pain =
{
	// Is the zombie in the process of dying?
	if (self.deadflag > DEAD_NO) return;
	// Always reset health
	// self.health = self.max_health;

	// go down immediately if a big enough hit
	if (self.axhitme == 2) {
		self.inpain = 2;
		zumbi_paine1 ();
		return;
	}

	//----------------------------------------------------------------------
	// Pain/damage too low OR down on ground, totally ignore
	//----------------------------------------------------------------------
	if (take < MONAI_ZOMBIELOW_DAM || self.inpain == 2) return;

	//----------------------------------------------------------------------
	// Damage 29-60, drop straight away to ground (SSG, Quad NG)
	// This has to be a single large hit over 0.1 frame
	//----------------------------------------------------------------------
	// if (take > MONAI_ZOMBIEHGH_DAM) {
		//zumbi_paine1();
		//return;
	//}

	//----------------------------------------------------------------------
	// Projectile shotguns pellets don't all hit at same time
	// they accumulate over time and can distort damage values
	// Need to block damage over time to detect second hit
	// Cannot use pain_finished because it blocks the pain function
	// and the health needs to be reset all the time
	// Using 'lefty' because zombies don't use it for anything
	if (self.lefty < time && self.inpain == 1) {
		// Second hit, drop to ground
		//zumbi_paine1 ();
		return;
	}

	//----------------------------------------------------------------------
	// Damage 9-25 random pain animation (random chance of knockdown painb)
	//----------------------------------------------------------------------
	if (self.inpain) return;	// Already in minor pain
	self.inpain = 1;			// Minor pain active
	self.lefty = time + 0.5;	// Wait for second hit
	self.lip = random();
	if (self.lip < 0.25) zumbi_paina1 ();		// 12 frames (bent over, short)
	else if (self.lip < 0.5) zumbi_painb1 ();	// 28 frames (9 = on ground)
	else if (self.lip < 0.75) zumbi_painc1 ();	// 18 frames (bent over, long)
	else zumbi_paind1 ();						// 13 frames (slight hit)
};

/*=============================================================================
 ZOMBIE WAKEUP (check if can get up)
=============================================================================*/
void() zumbi_wakeup	= {
	if (self.gibbed) return;			// Do nothing dead
	
	self.use = SUB_Null;				// No more using at this point
	if (!self.enemy) FindTarget();		// If no enemy, look around?

	// Make sure bounding box is correct, if blocked can be set 0,0,0
	setsize (self, self.bbmins, self.bbmaxs);
	// Turn monster collision on and test if can walk forward
	self.solid = SOLID_SLIDEBOX;
	if (!walkmove (0, 0))
	{
		self.inpain = 2;				// On ground
		self.nextthink = time + 0.1;	// Keep checking
		self.think = self.th_wakeup;	// Same function
		self.solid = SOLID_NOT;			// No world interaction yet
		// Check if something has been blocking the zombie from getting up
		// This is a check for weird world/bmodel geo or monster/players
		// standing on zombies while on the ground trying to get up!
		self.count = self.count + 1;
		if (self.count > MONAI_ZOMBGRDBLOCK) {
			self.health = self.gibhealth;	// Gib time
			Killed(self, self);				// Register death
			return;
		}
	}
	else {
		self.bodyonflr = "";			// Body is chop proof!
		self.inpain = 2;				// Animation not finished
		zumbi_sound(6);				// Wake up sound
		self.nextthink = time + 0.1;
		self.use = monster_use;			// Just in case interruption
		if (self.zombieflr == MONAI_ZOMBIEUPB) self.think = zumbi_painb10;
		else self.think = zumbi_paine13;
	}
};

//----------------------------------------------------------------------
// Puts the zombie on the floor with a random Yaw rotation
// paintype = 0 Setup on floor with use trigger
// paintype > 0 On floor and waiting to get back up
//----------------------------------------------------------------------
void(float frameno) zumbi_onground = {
	//self.health = self.max_health;	// reset health
	self.inpain = 2;				// Lying on floor, no pain
	self.count = 0;					// Reset get up tries
	self.solid = SOLID_NOT;			// No world interaction
	self.bodyonflr = MON_ONFLR;		// mark body for the chop

	// Does the zombie start on the ground?
	if (frameno == MONAI_ZOMBIEFLR) {
		// Do nothing else while on the floor
		self.nextthink = self.pausetime;
		self.think = SUB_Null;

		// Check for spawning onfloor orientation flag
		// aflag = 1 Forward = 2 Backward
		if (self.aflag < 1 || self.aflag > 2) {
			if (random() < 0.5) self.aflag = 1;
			else self.aflag = 2;
		}

		// Pick random starting pose
		if (self.aflag == 1) {
			self.zombieflr = MONAI_ZOMBIEUPB;
			self.frame = $painb9;
		}
		else {
			self.zombieflr = MONAI_ZOMBIEUPE;
			self.frame = $paine12;
		}
		// If no angle set, Random fall direction
		if (self.angles_y < 1) self.angles_y = rint(random()*359);
		self.use = self.th_wakeup;
		self.fixangle = TRUE;
		// Reset onspawn fall down angle (only used once)
		self.aflag = 0;
	}
	else {
		self.zombieflr = frameno;	// Wakeup pose for later
		// Keep zombies on the ground and check again later
		self.nextthink = self.nextthink + MONAI_ZOMBGRDTIMER;
		self.think = self.th_wakeup;
	}
};

/*============================================================================
 All sounds used
 1 = sticking around, crucified
 2 = strutting the stuff (walking)
 3 = running (in slow motion)
 4 = all pain routines (zumbi_paina1, _painb1, _painc1, _paind1, _paine1)
 5 = its a knockout!
 6 = get up and moan about it
 7 = fire zombie gib
============================================================================*/
void(float type) zumbi_sound =
{
	// check for gibbed or idle sound block
	if (self.health < 1) return;
	if (self.spawnflags & MON_SPAWN_NOIDLE && type < 3) return;
	
	// Random sound check
 	self.lip = random();
	if (type == 1) {
		if (self.lip < 0.1) 
			sound (self, CHAN_VOICE, "zombie/idle_w2.wav", 1, ATTN_STATIC);
	}
	else if (type == 2 && self.idletimer < time) {
	 	self.idletimer = time + 1 + (random()*2);
		if (self.lip < 0.2)
			sound (self, CHAN_VOICE, "zombie/z_idle.wav", 1, ATTN_IDLE);
	}
	else if (type == 3 && self.idletimer < time) {
	 	self.idletimer = time + 1 + (random()*2);
		if (self.lip < 0.2) sound (self, CHAN_VOICE, "zombie/z_idle.wav", 1, ATTN_IDLE);
		if (self.lip > 0.8) sound (self, CHAN_VOICE, "zombie/z_idle1.wav", 1, ATTN_IDLE);
	}
	else if (type == 4) {
		if (self.lip < 0.25) sound (self, CHAN_VOICE, self.pain_sound, 1, ATTN_NORM);
		else if (self.lip < 0.5) sound (self, CHAN_VOICE, self.pain_sound2, 1, ATTN_NORM);
	}
	else if (type == 5) {
		sound (self, CHAN_BODY, "zombie/z_fall.wav", 1, ATTN_NORM);
	}
	else if (type == 6) {
		if (self.lip < 0.5) sound (self, CHAN_VOICE, "zombie/z_idle.wav", 1, ATTN_IDLE);
		else sound (self, CHAN_VOICE, "zombie/z_idle1.wav", 1, ATTN_IDLE);
	}
	else if (type == 7) {
		sound (self, CHAN_WEAPON, "zombie/z_shot1.wav", 1, ATTN_NORM);
	}
};

//============================================================================
void() zumbi_die =
{
	ZMonsterDie(); // callback to zquake
	self.health = self.gibhealth; // Force gib
	monster_death_precheck();
};

//============================================================================
void() zumbi_cruc1	= [$cruc_1,zumbi_cruc2] {zumbi_sound(1);};
void() zumbi_cruc2	= [$cruc_2,zumbi_cruc3] {self.nextthink = time + 0.1 + random()*0.1;};
void() zumbi_cruc3	= [$cruc_3,zumbi_cruc4] {self.nextthink = time + 0.1 + random()*0.1;};
void() zumbi_cruc4	= [$cruc_4,zumbi_cruc5] {self.nextthink = time + 0.1 + random()*0.1;};
void() zumbi_cruc5	= [$cruc_5,zumbi_cruc6] {self.nextthink = time + 0.1 + random()*0.1;};
void() zumbi_cruc6	= [$cruc_6,zumbi_cruc1] {self.nextthink = time + 0.1 + random()*0.1;};

//----------------------------------------------------------------------
void(entity inflictor, entity attacker, float damage) zumbi_cruc_pain =
{
	self.health = self.max_health;				// reset health	
	// Any pain to moan about?
	if (self.pain_finished < time) zumbi_sound(4);
	self.pain_finished = time + 1 + random();
};

//----------------------------------------------------------------------
void() zumbi_cruc_spawn =
{
	self.use = SUB_Null;				// No more triggers
	self.solid = SOLID_BBOX;			// Interact with objects
	self.movetype = MOVETYPE_FLY;		// Cannot be movetype_none
	setmodel(self, self.mdl);			// Nail to cross
	setsize (self, self.bbmins, self.bbmaxs);

	// Setup exact/randon skin choices
	self.randomskin = 4;
	if (self.exactskin > 0) self.skin = rint(self.exactskin);
	else self.skin = rint(random()*(self.randomskin-1));
	if (self.skin < 0) self.skin = 0;	// Double check no negatives	
	
	self.takedamage = DAMAGE_AIM;		// Can receive damage
	self.velocity = '0 0 0';			// Make sure stationary
	self.deadflag = DEAD_NO;			// used to stop death re-triggering
	self.view_ofs = '0 0 -24';			// Standard setup
	self.pain_timeout = 1;				// Default
	
	zumbi_cruc1 ();					// Time to do some moaning
};

//----------------------------------------------------------------------
void() zumbi_cruc_setup =
{
	// Setup AI functions
	self.th_stand = self.th_walk = self.th_run = zumbi_cruc1;
	self.th_pain = zumbi_cruc_pain; self.th_die = zumbi_die;
	
	self.gibbed = FALSE;				// Still in one piece
	self.health = self.max_health = 60;	// Save for later
	self.gibhealth = 0 - self.health;	// Work out damage trigger
	self.pain_flinch = 10;				// Always in pain
	self.nomonstercount = TRUE;			// Don't include in initial total

	// Zumbis cannot be crucified and on the floor at once!
	self.spawnflags = self.spawnflags - (self.spawnflags & MON_ONFLOOR);
	
	self.flags = FL_MONSTER;			// Always reset this flag
	self.effects = 0;					// Always reset
	self.oldorigin = self.origin;		// Save origin
	self.bbmins = '-8 -8 -24';			// Narrow pole
	self.bbmaxs = '8 8 32';

	if (self.spawnflags & MON_SPAWN_DELAY) {
		setmodel(self, string_null);
		self.solid = SOLID_NOT;				// No world interaction
		self.use = zumbi_cruc_spawn;		// Wait for trigger
	}
	else {
		// Variable start delay on all monsters to reduce packet errors
		self.nextthink = time + 0.1 + random()*0.4;
		self.think = zumbi_cruc_spawn;
	}
};

/*======================================================================
 QUAKED monster_zumbi (1 0 0) (-16 -16 -24) (16 16 32) Crucified ambush FLOOR
If crucified, stick the bounding box 12 pixels back into a wall to look right.
======================================================================*/
void() monster_zumbi =
{
	if (deathmatch) { remove(self); return; }

	// Stupid ID getting the crucified and ambush back to front on zombies
	// Lets fix the problem and reverse the flags to match everything else
	if (self.classtype != CT_MONMUMMY) {
		if (self.spawnflags & MON_ZOMCRUCIFIED || self.spawnflags & MON_ZOMBAMBUSH) {
			self.health = 0;		// Temporarily use this variable
			if (self.spawnflags & MON_ZOMCRUCIFIED) self.health = self.health + MON_CRUCIFIED;
			if (self.spawnflags & MON_ZOMBAMBUSH) self.health = self.health + MON_AMBUSH;
			
			// Removed the old bits and then add the new one's
			self.spawnflags = self.spawnflags - (self.spawnflags & MON_ZOMIDHACK);
			self.spawnflags = self.spawnflags + self.health;
		}
	}

	self.mdl = "progs/mon_zombie.mdl";
	self.headmdl = "progs/h_zombie.mdl";
	precache_model (self.mdl);
	precache_model (self.headmdl);
	precache_model (MODEL_PROJ_FLESH); 	// Also in world.qc

	precache_sound ("zombie/z_idle.wav");	// Idle A
	precache_sound ("zombie/z_idle1.wav");	// Idle B
	precache_sound ("zombie/idle_w2.wav");	// Crucified

	self.pain_sound = "zombie/z_pain.wav";
	self.pain_sound2 = "zombie/z_pain1.wav";
	precache_sound (self.pain_sound);
	precache_sound (self.pain_sound2);

	precache_sound ("zombie/z_shot1.wav");	// Swipe sound
	precache_sound ("zombie/z_fall.wav");	// Impact - floor
	precache_sound ("zombie/z_miss.wav");	// Impact - miss
	precache_sound ("zombie/z_hit.wav");	// Impact - hit
	precache_sound ("zombie/z_gib.wav");	// Death sound

	self.sight_sound = "zombie/z_idle.wav";
	precache_sound (self.sight_sound);

	// Check for poisonous entity flag
	if (self.poisonous) {
		precache_poisongibs();				// precache gibs
		self.gibtype = GIBTYPE_POISON;		// Poisonous blood trails
		precache_model (MODEL_PROJ_FLESHP);	// Green flesh!?!
	}

	self.solid = SOLID_NOT;					// No interaction with world
	self.movetype = MOVETYPE_NONE;			// Static item, no movement
	if (self.bboxtype < 1) self.bboxtype = BBOX_SHORT;
	if (!self.classtype) self.classtype = CT_MONZOMBIE;
	self.classgroup = CG_ZOMBIE;			// One big happy zombie family!
	self.classmove = MON_MOVEWALK;
	if (!self.exactskin) self.randomskin = 4;
	if (self.deathstring == "")
		self.deathstring = " joins the Zumbis\n";

	// Always reset Ammo Resistance to be consistent
	self.resist_shells = self.resist_nails = 0;
	self.resist_rockets = self.resist_cells = 0;

	// Setup crucified zombies
	if (self.spawnflags & MON_CRUCIFIED) zumbi_cruc_setup();
	else {
		// Setup zombie ready for placement
		self.health = g_zombie_health;			// Basic health (cannot override)
		self.gibhealth = -60;					// Gib value, not used
		self.gibbed = FALSE;					// In one piece
		self.pain_flinch = MONAI_ZOMBIEHGH_DAM;
		self.steptype = FS_TYPESLOW;			// Small leg
		self.altsteptype = FS_TYPEDRAG;			// Clubfoot
		self.pain_timeout = -5;					// Always go into pain (health reset)
		if (!self.movespeed) self.movespeed = 1;// Adjustable speed via skill level
		self.inpain = 0;						// Zumbi starts with no pain lock
		self.count = 0;							// Reset get up timer

		self.th_stand = zumbi_stand1;
		self.th_walk = zumbi_walk1;
		self.th_run = zumbi_run1;
		self.th_pain = zumbi_pain;
		self.th_die = zumbi_die;
		self.th_missile = zumbi_missile;
		self.th_melee = zumbi_melee;
		self.th_wakeup = zumbi_wakeup;			// Get off floor
		self.th_checkattack = ZumbiCheckAttack;

		// enable missile attack?
		self.zombie_health = 0;
		if (g_current_wave >= 2 && g_current_wave < 120 && random() > (0.9 - (g_current_wave/120.0)))
		{
			self.zombie_health = 1;
		}
		else if (g_current_wave > 120 && random() > 0.1)
		{
			self.zombie_health = 1;
		}
		
		monster_start();
	}
};

/*======================================================================
 QUAKED monster_zmummy (1 0 0) (-16 -16 -24) (16 16 32) ambush x FLOOR
Poisonous Zumbi that explodes poisonous gibs on death
======================================================================*/
void() monster_zmummy =
{
	self.classtype = CT_MONMUMMY;			// Special poison zombie
	self.exactskin = 6;						// Mouldly bandages
	self.no_liquiddmg = TRUE;				// Immune to slime/lava
	self.spawnflags  = self.spawnflags - (self.spawnflags & MON_CRUCIFIED);
	self.deathstring = " was Mummified\n";
	
	// The mummy is just poisonous, it is still a zombie
	monster_zumbi();
};

