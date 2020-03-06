/*======================================================================
Zombie KNIGHT (undead version of original knight)
======================================================================*/
$cd id1/models/zombiek
$origin	0 0 24
$base base
$skin skin

// (001 - 015) Default stand - breathing
$frame stand1 stand2 stand3 stand4 stand5 stand6 stand7 stand8
$frame stand9 stand10 stand11 stand12 stand13 stand14 stand15

// (016 - 029) Default walk dragging left foot
$frame walk1 walk2 walk3 walk4 walk5 walk6 walk7 walk8 
$frame walk9 walk10 walk11 walk12 walk13 walk14

// (030 - 040) Default run, fast for a zombie
$frame run1 run2 run3 run4 run5 run6 run7 run8 run9 run10 run11

// (041 - 052) Still moving forward
$frame paina1 paina2 paina3 paina4 paina5 paina6 paina7 paina8
$frame paina9 paina10 paina11 paina12

// (053 - 077) Stagger backwards, long animation
$frame painb1 painb2 painb3 painb4 painb5 painb6 painb7 painb8
$frame painb9 painb10 painb11 painb12 painb13 painb14 painb15 painb16
$frame painb17 painb18 painb19 painb20 painb21 painb22 painb23 painb24 painb25

// (078 - 098) Fall down to knees and get back up
$frame painc1 painc2 painc3 painc4 painc5 painc6 painc7 painc8
$frame painc9 painc10 painc11 painc12 painc13 painc14 painc15 painc16
$frame painc17 painc18 painc19 painc20 painc21

// (099 - 121) Fall down FORWARD (paind12 = on floor)
$frame paind1 paind2 paind3 paind4 paind5 paind6 paind7 paind8
$frame paind9 paind10 paind11 paind12 paind13 paind14 paind15 paind16
$frame paind17 paind18 paind19 paind20 paind21 paind22 paind23

// (122 - 152) Fall down BACKWARD (paine12 = on floor)
$frame paine1 paine2 paine3 paine4 paine5 paine6 paine7 paine8
$frame paine9 paine10 paine11 paine12 paine13 paine14 paine15 paine16
$frame paine17 paine18 paine19 paine20 paine21 paine22 paine23 paine24
$frame paine25 paine26 paine27 paine28 paine29 paine30 paine31

// (153 - 171) Melee Attack 1 - Smash (chop overhead to ground)
$frame atta1 atta2 atta3 atta4 atta5 atta6 atta7 atta8
$frame atta9 atta10 atta11 atta12 atta13 atta14 atta15 atta16 atta17 atta18 atta19

// (172 - 188) Melee Attack 2 - Stationary over arm swing 
$frame attb1 attb2 attb3 attb4 attb5 attb6 attb7 attb8
$frame attb9 attb10 attb11 attb12 attb13 attb14 attb15 attb16 attb17

// (189 - 203) Melee Attack 3 - Stationary sideways swing
$frame attc1 attc2 attc3 attc4 attc5 attc6 attc7 attc8
$frame attc9 attc10 attc11 attc12 attc13 attc14 attc15

// (204 - 223) idle 2 - scratch brains
$frame idleb1 idleb2 idleb3 idleb4 idleb5 idleb6 idleb7 idleb8
$frame idleb9 idleb10 idleb11 idleb12 idleb13 idleb14 idleb15 idleb16
$frame idleb17 idleb18 idleb19 idleb20

// (224 - 238) idle 3 - swing head LEFT
$frame idlec1 idlec2 idlec3 idlec4 idlec5 idlec6 idlec7 idlec8
$frame idlec9 idlec10 idlec11 idlec12 idlec13 idlec14 idlec15

// (239 - 253) idle 4 - swing head RIGHT
$frame idled1 idled2 idled3 idled4 idled5 idled6 idled7 idled8
$frame idled9 idled10 idled11 idled12 idled13 idled14 idled15

void(float type) zumbik_sound;
void() zumbik_knockdown;
void(float frameno) zumbik_onground;

//=============================================================================
void() zumbik_standB1	=[	$idleb1,		zumbik_standB2	] {ai_stand();};
void() zumbik_standB2	=[	$idleb2,		zumbik_standB3	] {ai_stand();};
void() zumbik_standB3	=[	$idleb3,		zumbik_standB4	] {ai_stand();};
void() zumbik_standB4	=[	$idleb4,		zumbik_standB5	] {ai_stand();};
void() zumbik_standB5	=[	$idleb5,		zumbik_standB6	] {ai_stand();};
void() zumbik_standB6	=[	$idleb6,		zumbik_standB7	] {ai_stand();};
void() zumbik_standB7	=[	$idleb7,		zumbik_standB8	] {ai_stand();};
void() zumbik_standB8	=[	$idleb8,		zumbik_standB9	] {ai_stand();};
void() zumbik_standB9	=[	$idleb9,		zumbik_standB10	] {ai_stand();};
void() zumbik_standB10	=[	$idleb10,		zumbik_standB11	] {ai_stand();};
void() zumbik_standB11	=[	$idleb11,		zumbik_standB12	] {ai_stand();};
void() zumbik_standB12	=[	$idleb12,		zumbik_standB13	] {ai_stand();};
void() zumbik_standB13	=[	$idleb13,		zumbik_standB14	] {ai_stand();};
void() zumbik_standB14	=[	$idleb14,		zumbik_standB15	] {ai_stand();};
void() zumbik_standB15	=[	$idleb15,		zumbik_standB16	] {ai_stand();};
void() zumbik_standB16	=[	$idleb16,		zumbik_standB17	] {ai_stand();};
void() zumbik_standB17	=[	$idleb17,		zumbik_standB18	] {ai_stand();};
void() zumbik_standB18	=[	$idleb18,		zumbik_standB19	] {ai_stand();};
void() zumbik_standB19	=[	$idleb19,		zumbik_standB20	] {ai_stand();};
void() zumbik_standB20	=[	$idleb20,		zumbik_stand1	] {ai_stand();};

//=============================================================================
void() zumbik_standC1	=[	$idlec1,		zumbik_standC2	] {ai_stand();};
void() zumbik_standC2	=[	$idlec2,		zumbik_standC3	] {ai_stand();};
void() zumbik_standC3	=[	$idlec3,		zumbik_standC4	] {ai_stand();};
void() zumbik_standC4	=[	$idlec4,		zumbik_standC5	] {ai_stand();};
void() zumbik_standC5	=[	$idlec5,		zumbik_standC6	] {ai_stand();};
void() zumbik_standC6	=[	$idlec6,		zumbik_standC7	] {ai_stand();};
void() zumbik_standC7	=[	$idlec7,		zumbik_standC8	] {ai_stand();};
void() zumbik_standC8	=[	$idlec8,		zumbik_standC9	] {ai_stand();};
void() zumbik_standC9	=[	$idlec9,		zumbik_standC10	] {ai_stand();};
void() zumbik_standC10	=[	$idlec10,		zumbik_standC11	] {ai_stand();};
void() zumbik_standC11	=[	$idlec11,		zumbik_standC12	] {ai_stand();};
void() zumbik_standC12	=[	$idlec12,		zumbik_standC13	] {ai_stand();};
void() zumbik_standC13	=[	$idlec13,		zumbik_standC14	] {ai_stand();};
void() zumbik_standC14	=[	$idlec14,		zumbik_standC15	] {ai_stand();};
void() zumbik_standC15	=[	$idlec15,		zumbik_stand1	] {ai_stand();};

//=============================================================================
void() zumbik_standD1	=[	$idled1,		zumbik_standD2	] {ai_stand();};
void() zumbik_standD2	=[	$idled2,		zumbik_standD3	] {ai_stand();};
void() zumbik_standD3	=[	$idled3,		zumbik_standD4	] {ai_stand();};
void() zumbik_standD4	=[	$idled4,		zumbik_standD5	] {ai_stand();};
void() zumbik_standD5	=[	$idled5,		zumbik_standD6	] {ai_stand();};
void() zumbik_standD6	=[	$idled6,		zumbik_standD7	] {ai_stand();};
void() zumbik_standD7	=[	$idled7,		zumbik_standD8	] {ai_stand();};
void() zumbik_standD8	=[	$idled8,		zumbik_standD9	] {ai_stand();};
void() zumbik_standD9	=[	$idled9,		zumbik_standD10	] {ai_stand();};
void() zumbik_standD10	=[	$idled10,		zumbik_standD11	] {ai_stand();};
void() zumbik_standD11	=[	$idled11,		zumbik_standD12	] {ai_stand();};
void() zumbik_standD12	=[	$idled12,		zumbik_standD13	] {ai_stand();};
void() zumbik_standD13	=[	$idled13,		zumbik_standD14	] {ai_stand();};
void() zumbik_standD14	=[	$idled14,		zumbik_standD15	] {ai_stand();};
void() zumbik_standD15	=[	$idled15,		zumbik_stand1	] {ai_stand();};

//----------------------------------------------------------------------
void() zumbik_standE1	=[	$idlec1,		zumbik_standE2	] {ai_stand();};
void() zumbik_standE2	=[	$idlec2,		zumbik_standE3	] {ai_stand();};
void() zumbik_standE3	=[	$idlec3,		zumbik_standE4	] {ai_stand();};
void() zumbik_standE4	=[	$idlec4,		zumbik_standE5	] {ai_stand();};
void() zumbik_standE5	=[	$idlec5,		zumbik_standE6	] {ai_stand();};
void() zumbik_standE6	=[	$idlec6,		zumbik_standE7	] {ai_stand();};
void() zumbik_standE7	=[	$idlec7,		zumbik_standE8	] {ai_stand();};
void() zumbik_standE8	=[	$idlec8,		zumbik_standE9	] {ai_stand();};
void() zumbik_standE9	=[	$idlec9,		zumbik_standE10	] {ai_stand();};
void() zumbik_standE10	=[	$idlec10,		zumbik_standE11	] {ai_stand();};
void() zumbik_standE11	=[	$idlec11,		zumbik_standE12	] {ai_stand();};
void() zumbik_standE12	=[	$idlec12,		zumbik_standE13	] {ai_stand();};
void() zumbik_standE13	=[	$idlec13,		zumbik_standE14	] {ai_stand();};
void() zumbik_standE14	=[	$idlec14,		zumbik_standE15	] {ai_stand();};
void() zumbik_standE15	=[	$idlec15,		zumbik_standE16	] {ai_stand();};
void() zumbik_standE16	=[	$idled1,		zumbik_standE17	] {ai_stand();};
void() zumbik_standE17	=[	$idled2,		zumbik_standE18	] {ai_stand();};
void() zumbik_standE18	=[	$idled3,		zumbik_standE19	] {ai_stand();};
void() zumbik_standE19	=[	$idled4,		zumbik_standE20	] {ai_stand();};
void() zumbik_standE20	=[	$idled5,		zumbik_standE21	] {ai_stand();};
void() zumbik_standE21	=[	$idled6,		zumbik_standE22	] {ai_stand();};
void() zumbik_standE22	=[	$idled7,		zumbik_standE23	] {ai_stand();};
void() zumbik_standE23	=[	$idled8,		zumbik_standE24	] {ai_stand();};
void() zumbik_standE24	=[	$idled9,		zumbik_standE25	] {ai_stand();};
void() zumbik_standE25	=[	$idled10,		zumbik_standE26	] {ai_stand();};
void() zumbik_standE26	=[	$idled11,		zumbik_standE27	] {ai_stand();};
void() zumbik_standE27	=[	$idled12,		zumbik_standE28	] {ai_stand();};
void() zumbik_standE28	=[	$idled13,		zumbik_standE29	] {ai_stand();};
void() zumbik_standE29	=[	$idled14,		zumbik_standE30	] {ai_stand();};
void() zumbik_standE30	=[	$idled15,		zumbik_stand1	] {ai_stand();};

//----------------------------------------------------------------------
void() zumbik_stand1	=[	$stand1,		zumbik_stand2	] {ai_stand();};
void() zumbik_stand2	=[	$stand2,		zumbik_stand3	] {ai_stand();};
void() zumbik_stand3	=[	$stand3,		zumbik_stand4	] {ai_stand();};
void() zumbik_stand4	=[	$stand4,		zumbik_stand5	] {ai_stand();};
void() zumbik_stand5	=[	$stand5,		zumbik_stand6	] {ai_stand();};
void() zumbik_stand6	=[	$stand6,		zumbik_stand7	] {ai_stand();};
void() zumbik_stand7	=[	$stand7,		zumbik_stand8	] {ai_stand();};
void() zumbik_stand8	=[	$stand8,		zumbik_stand9	] {ai_stand();};
void() zumbik_stand9	=[	$stand9,		zumbik_stand10	] {ai_stand();};
void() zumbik_stand10	=[	$stand10,		zumbik_stand11	] {ai_stand();};
void() zumbik_stand11	=[	$stand11,		zumbik_stand12	] {ai_stand();};
void() zumbik_stand12	=[	$stand12,		zumbik_stand13	] {ai_stand();};
void() zumbik_stand13	=[	$stand13,		zumbik_stand14	] {ai_stand();};
void() zumbik_stand14	=[	$stand14,		zumbik_stand15	] {ai_stand();};
void() zumbik_stand15	=[	$stand15,		zumbik_stand1	] {
	self.idlebusy = FALSE;
	self.solid = SOLID_SLIDEBOX;
	if (random() < MON_IDLE_ANIMATION) {
		self.idlebusy = TRUE;
		// Make sure the idle animations don't repeat in a row
		self.lefty = self.lip;
		while (self.lefty == self.lip) { self.lefty = rint(random()*4);}
		self.lip = self.lefty;
		if (self.lip < 1) self.think = zumbik_standB1;				// Pick brains!
		else if (self.lip < 2) self.think = zumbik_standE1;	// Look BOTH
		else if (self.lip < 3) self.think = zumbik_standC1;	// Look LEFT
		else self.think = zumbik_standD1;										// Look RIGHT
	}
	ai_stand();
};

//============================================================================
void() zumbik_walk1	=[	$walk1,		zumbik_walk2	] {
	self.inpain = 0; self.solid = SOLID_SLIDEBOX; ai_walk(1);};
void() zumbik_walk2	=[	$walk2,		zumbik_walk3	] {ai_walk(1);};
void() zumbik_walk3	=[	$walk3,		zumbik_walk4	] {ai_walk(4);};
void() zumbik_walk4	=[	$walk4,		zumbik_walk5	] {ai_walk(4);};
void() zumbik_walk5	=[	$walk5,		zumbik_walk6	] {ai_walk(2);};
void() zumbik_walk6	=[	$walk6,		zumbik_walk7	] {ai_walk(1);};
void() zumbik_walk7	=[	$walk7,		zumbik_walk8	] {ai_walk(1);};
void() zumbik_walk8	=[	$walk8,		zumbik_walk9	] {ai_walk(1);monster_footstep(FALSE);};
void() zumbik_walk9	=[	$walk9,		zumbik_walk10] {ai_walk(1);};
void() zumbik_walk10	=[	$walk10,	zumbik_walk11] {ai_walk(1);};
void() zumbik_walk11	=[	$walk11,	zumbik_walk12] {ai_walk(1);};
void() zumbik_walk12	=[	$walk12,	zumbik_walk13] {ai_walk(1);monster_footstep(TRUE);};	// Scrapping Clubfoot
void() zumbik_walk13	=[	$walk13,	zumbik_walk14] {ai_walk(1);};
void() zumbik_walk14	=[	$walk14,	zumbik_walk1	] {zumbik_sound(2);ai_walk(1);};

//============================================================================
void() zumbik_run1		=[	$run1,		zumbik_run2	] {
	self.inpain = 0; self.solid = SOLID_SLIDEBOX; ai_run(12);};
void() zumbik_run2		=[	$run2,		zumbik_run3	] {ai_run(12);};
void() zumbik_run3		=[	$run3,		zumbik_run4	] {ai_run(13);};
void() zumbik_run4		=[	$run4,		zumbik_run5	] {ai_run(12);};
void() zumbik_run5		=[	$run5,		zumbik_run6	] {ai_run(12);monster_footstep(FALSE);};
void() zumbik_run6		=[	$run6,		zumbik_run7	] {ai_run(12);};
void() zumbik_run7		=[	$run7,		zumbik_run8	] {ai_run(12);};
void() zumbik_run8		=[	$run8,		zumbik_run9	] {ai_run(11);};
void() zumbik_run9		=[	$run9,		zumbik_run10	] {ai_run(14);};
void() zumbik_run10	=[	$run10,		zumbik_run11	] {ai_run(13);};
void() zumbik_run11	=[	$run11,		zumbik_run1	] {ai_run(11); 
	self.steptype = FS_TYPEHEAVY;		// Heavy clubfoot
	monster_footstep(FALSE);
	self.steptype = FS_TYPESLOW;		// Normal zombie foot
};

//===========================================================================
// Melee Attack 2 - Stationary over arm swing (17->12 frames)
// Removed frames 1,3,4,5,7
void()	zumbik_attb1	=[	$attb2,		zumbik_attb6 ] {ai_face();};
void()	zumbik_attb6	=[	$attb6,		zumbik_attb8	] {ai_face();};
void()	zumbik_attb8	=[	$attb8,		zumbik_attb9	] {ai_face();zumbik_sound(7);};
void()	zumbik_attb9	=[	$attb9,		zumbik_attb10] {ai_face();};
void()	zumbik_attb10=[	$attb10,	zumbik_attb11] {ai_face();ai_melee();};
void()	zumbik_attb11=[	$attb11,	zumbik_attb12] {ai_melee();};
void()	zumbik_attb12=[	$attb12,	zumbik_attb13] {ai_melee();};
void()	zumbik_attb13=[	$attb13,	zumbik_attb14] {};
void()	zumbik_attb14=[	$attb14,	zumbik_attb15] {};
void()	zumbik_attb15=[	$attb15,	zumbik_attb16] {};
void()	zumbik_attb16=[	$attb16,	zumbik_attb17] {};
void()	zumbik_attb17=[	$attb17,	zumbik_run1	] {};

//----------------------------------------------------------------------
// Melee Attack 3 - Stationary sideways swing (15->12 frames)
// Removed frames 1,3,15
void()	zumbik_attc1	=[	$attc2,		zumbik_attc4	] {ai_face();};
void()	zumbik_attc4	=[	$attc4,		zumbik_attc5	] {ai_face();};
void()	zumbik_attc5	=[	$attc5,		zumbik_attc6	] {zumbik_sound(7); ai_face();};
void()	zumbik_attc6	=[	$attc6,		zumbik_attc7	] {ai_face();};
void()	zumbik_attc7	=[	$attc7,		zumbik_attc8	] {ai_face();ai_melee();};
void()	zumbik_attc8	=[	$attc8,		zumbik_attc9	] {ai_melee();};
void()	zumbik_attc9	=[	$attc9,		zumbik_attc10] {ai_melee();};
void()	zumbik_attc10=[	$attc10,	zumbik_attc11] {};
void()	zumbik_attc11=[	$attc11,	zumbik_attc12] {};
void()	zumbik_attc12=[	$attc12,	zumbik_attc13] {};
void()	zumbik_attc13=[	$attc13,	zumbik_attc14] {};
void()	zumbik_attc14=[	$attc14,	zumbik_run1	] {};

//----------------------------------------------------------------------
void() zumbik_melee =
{
	ai_face ();		// Turn towards enemy target
	walkmove (self.ideal_yaw, 20);

	// Randomly select melee attacks
	if (random() < 0.5) zumbik_attb1();	// Stationary over arm swing 
	else zumbik_attc1();					// Stationary sideways swing
};

//============================================================================
// Jump + melee attack
// Melee Attack 1 - Smash, chop overhead to ground (19->10/11 frames)
//============================================================================
void()	zumbik_JumpTouch =
{
	local float ldmg;
	
	if (self.health < 1) return;
	ai_jumpbreakable(20);			// Damage any breakables
	self.touch = SUB_Null;			// No more touching
	self.think = self.th_jumpexit;	// Exit frame
	self.jumptouch = other;			// Keep track of touch target

	if ( CanDamage(other, self) ) {
		if ( vlen(self.velocity) > 300 ) {
		  ldmg = 10 + 10*random();
			T_Damage (other, self, self, ldmg, DAMARMOR);	
			spawn_touchblood (self, self.enemy, ldmg*3);

			// Check for poisonous attribute (new poison version)
			if (self.poisonous) PoisonDeBuff(self.enemy);
		}
	}

	// Is the zombie knight floating in the air?
	if (!checkbottom(self)) {
		// Is the zombie knight standing on something?		
		if (self.flags & FL_ONGROUND) {	
			// Do an extra jump if got the count
			if (self.count < 2)  self.think = self.th_jump;
		}
	}

	// Next timer
	self.nextthink = time + 0.1;
};

//----------------------------------------------------------------------
void()	zumbik_jump1	=[	$atta1,		zumbik_jump2 ] {ai_charge(12);
	self.jump_flag = time + MONAI_JUMPZOMBTIME;
	zumbik_sound(3);	// Moan about jumping forward
};
void()	zumbik_jump2	=[	$atta2,		zumbik_jump3 ] {ai_charge(16);};
void()	zumbik_jump3	=[	$atta3,		zumbik_jump4 ] {
	ai_face();
	self.jump_flag = time + MONAI_JUMPZOMBTIME;
	self.touch = zumbik_JumpTouch;
	makevectors (self.angles);
	self.velocity = v_forward * (150 + random() * 50) + '0 0 200';
	self.origin_z = self.origin_z + 4;
	self.flags = self.flags - (self.flags & FL_ONGROUND);
	self.oldorigin = self.origin;
};

// Flying through the air waiting to touch something!
void()	zumbik_jump4	=[	$atta4,		zumbik_jump5 ] {ai_face();};
void()	zumbik_jump5	=[	$atta5,		zumbik_jump6	] {ai_face();};
void()	zumbik_jump6	=[	$atta6,		zumbik_jump6	] {ai_face();};
void()	zumbik_jump7	=[	$atta7,		zumbik_jump7	] {ai_face();};
void()	zumbik_jump8	=[	$atta8,		zumbik_jump9	] {ai_face();
	// Double check monster is still falling?
	if (CheckZeroVector(self.velocity) || self.oldorigin == self.origin) {
		if (!checkbottom(self)) {
			self.ideal_yaw = random() * 360; 	//random jump angle
			self.think = zumbik_jump3;
		}
	}
	self.oldorigin = self.origin;
};

//----------------------------------------------------------------------
void() zumbik_jump15;		// Chance of quick animation exit
void()	zumbik_jump9	=[	$atta9,		zumbik_jump10] {ai_melee();};
void()	zumbik_jump10=[	$atta10,	zumbik_jump11] {ai_melee();};
void()	zumbik_jump11=[	$atta11,	zumbik_jump12] {};
void()	zumbik_jump12=[	$atta12,	zumbik_jump13] {
	if (random() < 0.5) self.think = zumbik_jump15;};	// quick recovery
void()	zumbik_jump13=[	$atta13,	zumbik_jump14] {};
void()	zumbik_jump14=[	$atta14,	zumbik_jump16] {};
void()	zumbik_jump15=[	$atta15,	zumbik_jump16] {};
void()	zumbik_jump16=[	$atta16,	zumbik_jump18] {};
void()	zumbik_jump18=[	$atta18,	zumbik_run1 ] {ai_resetangles();};

/*======================================================================
  PAIN
========================================================================*/
void()	zumbik_paina1	=[	$paina1,		zumbik_paina2	] {zumbik_sound(4);ai_painforward(8);};
void()	zumbik_paina2	=[	$paina2,		zumbik_paina3	] {ai_painforward(3);};
void()	zumbik_paina3	=[	$paina3,		zumbik_paina4	] {ai_painforward(3);};
void()	zumbik_paina4	=[	$paina4,		zumbik_paina5	] {ai_painforward(3);monster_footstep(FALSE);};
void()	zumbik_paina5	=[	$paina5,		zumbik_paina6	] {ai_painforward(3);};
void()	zumbik_paina6	=[	$paina6,		zumbik_paina7	] {ai_painforward(3);};
void()	zumbik_paina7	=[	$paina7,		zumbik_paina8	] {ai_painforward(3);};
void()	zumbik_paina8	=[	$paina8,		zumbik_paina9	] {ai_painforward(3);};
void()	zumbik_paina9	=[	$paina9,		zumbik_paina10	] {ai_painforward(2);monster_footstep(FALSE);};
void()	zumbik_paina10	=[	$paina10,		zumbik_paina11	] {ai_painforward(1);};
void()	zumbik_paina11	=[	$paina11,		zumbik_paina12	] {ai_painforward(2);};
void()	zumbik_paina12	=[	$paina12,		zumbik_run1	] {ai_painforward(1);self.inpain = 0;};

//----------------------------------------------------------------------
void()	zumbik_painb1	=[	$painb1,		zumbik_painb2	] {zumbik_sound(4);ai_painforward(8);};
void()	zumbik_painb2	=[	$painb2,		zumbik_painb3	] {ai_pain(1);};
void()	zumbik_painb3	=[	$painb3,		zumbik_painb4	] {ai_pain(1);};
void()	zumbik_painb4	=[	$painb4,		zumbik_painb5	] {ai_pain(1);};
void()	zumbik_painb5	=[	$painb5,		zumbik_painb6	] {ai_pain(1);};
void()	zumbik_painb6	=[	$painb6,		zumbik_painb7	] {ai_pain(2);};
void()	zumbik_painb7	=[	$painb7,		zumbik_painb8	] {ai_pain(2);};
void()	zumbik_painb8	=[	$painb8,		zumbik_painb9	] {ai_pain(4);};
void()	zumbik_painb9	=[	$painb9,		zumbik_painb10	] {ai_pain(4);};
void()	zumbik_painb10	=[	$painb10,		zumbik_painb11	] {ai_pain(4);};
void()	zumbik_painb11	=[	$painb11,		zumbik_painb12	] {ai_pain(2);monster_footstep(FALSE);};
void()	zumbik_painb12	=[	$painb12,		zumbik_painb13	] {ai_pain(2);};
void()	zumbik_painb13	=[	$painb13,		zumbik_painb14	] {ai_pain(3);};
void()	zumbik_painb14	=[	$painb14,		zumbik_painb15	] {};
void()	zumbik_painb15	=[	$painb15,		zumbik_painb16	] {};
void()	zumbik_painb16	=[	$painb16,		zumbik_painb17	] {};
void()	zumbik_painb17	=[	$painb17,		zumbik_painb18	] {};
void()	zumbik_painb18	=[	$painb18,		zumbik_painb19	] {ai_painforward(3);};
void()	zumbik_painb19	=[	$painb19,		zumbik_painb20	] {ai_painforward(3);};
void()	zumbik_painb20	=[	$painb20,		zumbik_painb21	] {ai_painforward(3);};
void()	zumbik_painb21	=[	$painb21,		zumbik_painb22	] {ai_painforward(3);};
void()	zumbik_painb22	=[	$painb22,		zumbik_painb23	] {ai_painforward(3);};
void()	zumbik_painb23	=[	$painb23,		zumbik_painb24	] {ai_painforward(3);};
void()	zumbik_painb24	=[	$painb24,		zumbik_painb25	] {ai_painforward(3);};
void()	zumbik_painb25	=[	$painb25,		zumbik_run1	] {ai_painforward(3);};

//----------------------------------------------------------------------
void()	zumbik_painc1	=[	$painc1,		zumbik_painc2	] {zumbik_sound(4);ai_painforward(8);};
void()	zumbik_painc2	=[	$painc2,		zumbik_painc3	] {ai_painforward(6);};
void()	zumbik_painc3	=[	$painc3,		zumbik_painc4	] {ai_painforward(5);};
void()	zumbik_painc4	=[	$painc4,		zumbik_painc5	] {ai_painforward(7);zumbik_sound(5);};
void()	zumbik_painc5	=[	$painc5,		zumbik_painc6	] {ai_painforward(6);};
void()	zumbik_painc6	=[	$painc6,		zumbik_painc7	] {ai_painforward(3);};
void()	zumbik_painc7	=[	$painc7,		zumbik_painc8	] {ai_painforward(3);};
void()	zumbik_painc8	=[	$painc8,		zumbik_painc9	] {};
void()	zumbik_painc9	=[	$painc9,		zumbik_painc10	] {};

// Re-entry point for painD wakeup animation
void()	zumbik_painc10	=[	$painc10,		zumbik_painc11	] {};
void()	zumbik_painc11	=[	$painc11,		zumbik_painc12	] {};
void()	zumbik_painc12	=[	$painc12,		zumbik_painc13	] {};
void()	zumbik_painc13	=[	$painc13,		zumbik_painc14	] {};
void()	zumbik_painc14	=[	$painc14,		zumbik_painc15	] {};
void()	zumbik_painc15	=[	$painc15,		zumbik_painc16	] {};
void()	zumbik_painc16	=[	$painc16,		zumbik_painc17	] {};
void()	zumbik_painc17	=[	$painc17,		zumbik_painc18	] {};
void()	zumbik_painc18	=[	$painc18,		zumbik_painc19	] {};
void()	zumbik_painc19	=[	$painc19,		zumbik_painc20	] {monster_footstep(FALSE);};
void()	zumbik_painc20	=[	$painc20,		zumbik_painc21	] {};
void()	zumbik_painc21	=[	$painc21,		zumbik_run1	] {};

//----------------------------------------------------------------------
void()	zumbik_paind1	=[	$paind1,		zumbik_paind2	] {
	self.inpain = 2;
	zumbik_sound(4);
	ai_painforward(8);
};
void()	zumbik_paind2	=[	$paind2,		zumbik_paind3	] {ai_painforward(4);};
void()	zumbik_paind3	=[	$paind3,		zumbik_paind4	] {ai_painforward(4);};
void()	zumbik_paind4	=[	$paind4,		zumbik_paind5	] {ai_painforward(4);};
void()	zumbik_paind5	=[	$paind5,		zumbik_paind6	] {ai_painforward(3);};
void()	zumbik_paind6	=[	$paind6,		zumbik_paind7	] {ai_painforward(2);};
void()	zumbik_paind7	=[	$paind7,		zumbik_paind8	] {ai_painforward(2);};
void()	zumbik_paind8	=[	$paind8,		zumbik_paind9	] {};
void()	zumbik_paind9	=[	$paind9,		zumbik_paind10	] {};
void()	zumbik_paind10	=[	$paind10,		zumbik_paind11	] {zumbik_sound(5);};
void()	zumbik_paind11	=[	$paind11,		zumbik_paind12	] {self.solid = SOLID_NOT;};
void()	zumbik_paind12	=[	$paind12,		zumbik_paind12	] {zumbik_onground(MONAI_ZOMBIEUPD);};

// Start of get up sequence
void()	zumbik_paind13	=[	$paind13,		zumbik_paind14	] {};
void()	zumbik_paind14	=[	$paind14,		zumbik_paind15	] {};
void()	zumbik_paind15	=[	$paind15,		zumbik_paind16	] {};
void()	zumbik_paind16	=[	$paind16,		zumbik_paind17	] {};
void()	zumbik_paind17	=[	$paind17,		zumbik_paind18	] {
	monster_footstep(TRUE);ai_pain(1);};		// Scrapping feet sound while standing up
void()	zumbik_paind18	=[	$paind18,		zumbik_paind19	] {ai_pain(1);};
void()	zumbik_paind19	=[	$paind19,		zumbik_paind20	] {ai_pain(1);};
void()	zumbik_paind20	=[	$paind20,		zumbik_paind21	] {ai_pain(1);};
void()	zumbik_paind21	=[	$paind21,		zumbik_paind22	] {ai_pain(1);};
void()	zumbik_paind22	=[	$paind22,		zumbik_paind23	] {ai_pain(2);};
void()	zumbik_paind23	=[	$paind23,		zumbik_painw10	] {ai_pain(2);};
// Originally re-entry to C, need onfloor check
void()	zumbik_painw10	=[	$painc10,		zumbik_painw11	] {};
void()	zumbik_painw11	=[	$painc11,		zumbik_painw12	] {};
void()	zumbik_painw12	=[	$painc12,		zumbik_painw13	] {};
void()	zumbik_painw13	=[	$painc13,		zumbik_painw14	] {};
void()	zumbik_painw14	=[	$painc14,		zumbik_painw15	] {};
void()	zumbik_painw15	=[	$painc15,		zumbik_painw16	] {};
void()	zumbik_painw16	=[	$painc16,		zumbik_painw17	] {};
void()	zumbik_painw17	=[	$painc17,		zumbik_painw18	] {};
void()	zumbik_painw18	=[	$painc18,		zumbik_painw19	] {};
void()	zumbik_painw19	=[	$painc19,		zumbik_painw20	] {monster_footstep(FALSE);};
void()	zumbik_painw20	=[	$painc20,		zumbik_painw21	] {};
void()	zumbik_painw21	=[	$painc21,		zumbik_run1	] {
	// If getting up for the first time (onfloor) check for targets
	if (self.spawnflags & MON_ONFLOOR) {
		self.spawnflags = self.spawnflags - MON_ONFLOOR;
		monster_targets();
	}
};

//----------------------------------------------------------------------
void()	zumbik_paine1	=[	$paine1,		zumbik_paine2	] {
	self.inpain = 2;
	zumbik_sound(4);
	ai_pain(8);
};
void()	zumbik_paine2	=[	$paine2,		zumbik_paine3	] {ai_pain(4);};
void()	zumbik_paine3	=[	$paine3,		zumbik_paine4	] {ai_pain(3);};
void()	zumbik_paine4	=[	$paine4,		zumbik_paine5	] {ai_pain(3);};
void()	zumbik_paine5	=[	$paine5,		zumbik_paine6	] {ai_pain(3);};
void()	zumbik_paine6	=[	$paine6,		zumbik_paine7	] {ai_pain(2);};
void()	zumbik_paine7	=[	$paine7,		zumbik_paine8	] {ai_pain(2);};
void()	zumbik_paine8	=[	$paine8,		zumbik_paine9	] {};
void()	zumbik_paine9	=[	$paine9,		zumbik_paine10	] {};
void()	zumbik_paine10	=[	$paine10,		zumbik_paine11	] {self.solid = SOLID_NOT;};
void()	zumbik_paine11	=[	$paine11,		zumbik_paine12	] {zumbik_sound(5);};
void()	zumbik_paine12	=[	$paine12,		zumbik_paine12	] {zumbik_onground(MONAI_ZOMBIEUPE);};

// Start of get up sequence
void()	zumbik_paine13	=[	$paine13,		zumbik_paine14	] {
	monster_footstep(TRUE);		// Scrapping feet sound while standing up
};
void()	zumbik_paine14	=[	$paine14,		zumbik_paine15	] {};
void()	zumbik_paine15	=[	$paine15,		zumbik_paine16	] {};
void()	zumbik_paine16	=[	$paine16,		zumbik_paine17	] {};
void()	zumbik_paine17	=[	$paine18,		zumbik_paine18	] {};
void()	zumbik_paine18	=[	$paine17,		zumbik_paine19	] {};
void()	zumbik_paine19	=[	$paine19,		zumbik_paine20	] {
	self.steptype = FS_TYPEHEAVY;		// Heavy clubfoot
	monster_footstep(FALSE);
	self.steptype = FS_TYPESLOW;		// Normal zombie foot
};
void()	zumbik_paine20	=[	$paine20,		zumbik_paine21	] {};
void()	zumbik_paine21	=[	$paine21,		zumbik_paine22	] {};
void()	zumbik_paine22	=[	$paine22,		zumbik_paine23	] {};
void()	zumbik_paine23	=[	$paine23,		zumbik_paine24	] {};
void()	zumbik_paine24	=[	$paine24,		zumbik_paine25	] {};
void()	zumbik_paine25	=[	$paine25,		zumbik_paine26	] {};
void()	zumbik_paine26	=[	$paine26,		zumbik_paine27	] {};
void()	zumbik_paine27	=[	$paine27,		zumbik_paine28	] {ai_painforward(3);};
void()	zumbik_paine28	=[	$paine28,		zumbik_paine29	] {ai_painforward(3);};
void()	zumbik_paine29	=[	$paine29,		zumbik_paine30	] {ai_painforward(3);};
void()	zumbik_paine30	=[	$paine30,		zumbik_paine31	] {ai_painforward(3);};
void()	zumbik_paine31	=[	$paine31,		zumbik_run1	] {ai_painforward(3);
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
void(entity inflictor, entity attacker, float take) zumbik_pain =
{
	// Is the zombie in the process of dying?
	if (self.deadflag > DEAD_NO) return;
	// Always reset health
	//self.health = self.max_health;
	self.attack_elev = targzone(self, attacker);

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
	//if (take > MONAI_ZOMBIEHGH_DAM) {
	//	zumbik_knockdown();
	//	return;
	//}

	//----------------------------------------------------------------------
	// Projectile shotguns pellets don't all hit at same time
	// they accumulate over time and can distort damage values
	// Need to block damage over time to detect second hit
	// Cannot use pain_finished because it blocks the pain function
	// and the health needs to be reset all the time
	// Using 'lefty' because zombiek only use it for idle animations
	if (self.lefty < time && self.inpain == 1) {
		// Second hit, drop to ground
		zumbik_knockdown();
		return;
	}

	//----------------------------------------------------------------------
	// Damage 9-25 random pain animation (random chance of knockdown)
	//----------------------------------------------------------------------
	if (self.inpain) return;	// Already in minor pain
	self.inpain = 1;			// Minor pain active
	self.lefty = time + 0.5;	// Wait for second hit
	self.lip = random();
	if (self.lip < 0.25) zumbik_paina1 ();			// 12 frames (drag foot)
	else if (self.lip < 0.5) zumbik_knockdown();	// ON THE GROUND
	else if (self.lip <  0.75 && self.attack_elev == TARGET_FRONT) 
		zumbik_painb1 ();					// 25 frames (flail arms backwards)
	else zumbik_painc1 ();					// 21 frames (fall to knees)
};

/*=============================================================================
 ZOMBIE WAKEUP (check if can get up)
=============================================================================*/
void() zumbik_wakeup	= {
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
		self.bodyonflr = string_null;	// Body is chop proof!
		self.inpain = 2;				// Animation not finished
		zumbik_sound(6);				// Wake up sound
		self.nextthink = time + 0.1;
		self.use = monster_use;			// Just in case interruption
		if (self.zombieflr == MONAI_ZOMBIEUPD) self.think = zumbik_paind13;
		else self.think = zumbik_paine13;
	}
};

//----------------------------------------------------------------------
// Puts the zombie on the floor with a random Yaw rotation
// IF frameno = MONAI_ZOMBIEFLR Setup on floor with use trigger
// ELSE setup next think timer and wait for opportunity to get back up
//----------------------------------------------------------------------
void(float frameno) zumbik_onground = {	
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
			self.zombieflr = MONAI_ZOMBIEUPD;
			self.frame = $paind12;
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
		// Zombie fall down function defines wake up pose
		self.zombieflr = frameno;
		// Keep zombies on the ground and check again later
		self.nextthink = self.nextthink + MONAI_ZOMBGRDTIMER;
		self.think = self.th_wakeup;
	}
};

//----------------------------------------------------------------------
// Puts the zombie on the floor based on the angle of attack
// 270-360, 360-90 : Fall forward (3 checks Left, middle, right)
// 180-270, 90-180 : Fall backward
//----------------------------------------------------------------------
void() zumbik_knockdown =
{
	local float enemy_ang, comp_ang;
	
	// Work out which direction the damage came from (enemy)
	enemy_ang = targangle(self, self.enemy, 0, FALSE);
	comp_ang = anglemod(enemy_ang + 45);	// Shift clockwise (front cone)
	
	//if (self.debuglvl) {
	//	dprint("Self ("); dprint(ftos(self.angles_y));
	//	dprint(") Targ ("); dprint(ftos(enemy_ang));
	//	dprint(") Comp ("); dprint(ftos(comp_ang));
	//	dprint(")\n");
	//}
	
	// NORTH WEST : 270-315 (fall BACKWARD, reverse force)
	if (comp_ang > 315) {
		//if (self.debuglvl) dprint("\b[KNOCKDOWN]\b HIT from the UPPER LEFT\n");
		self.ideal_yaw = anglemod(enemy_ang + 180);
		ChangeYaw ();
		zumbik_paine1();
	}
	// SOUTH WEST : 225-270 (fall FORWARD, side force +45)
	else if (comp_ang > 270) {
		//if (self.debuglvl) dprint("\b[KNOCKDOWN]\b HIT from the LOWER LEFT\n");
		self.ideal_yaw = comp_ang;
		ChangeYaw ();
		zumbik_paind1();
	}
	// SOUTH : 135-225 (fall FORWARD)
	else if (comp_ang > 180) {
		//if (self.debuglvl) dprint("\b[KNOCKDOWN]\b HIT from the BACK\n");
		self.ideal_yaw = self.angles_y;	// Fix for ai_painforward
		ChangeYaw ();
		zumbik_paind1();
	}
	// SOUTH EAST : 90-135 (fall FORWARD, side force -45)
	else if (comp_ang > 135) {
		//if (self.debuglvl) dprint("\b[KNOCKDOWN]\b HIT from the LOWER RIGHT\n");
		self.ideal_yaw = anglemod(enemy_ang+315);
		ChangeYaw ();	
		zumbik_paind1();
	}
	// NORTH EAST : 45-90 (fall BACKWARD, reverse force)
	else if (comp_ang > 90) {
		//if (self.debuglvl) dprint("\b[KNOCKDOWN]\b HIT from the UPPER RIGHT\n");
		self.ideal_yaw = anglemod(enemy_ang + 180);
		ChangeYaw ();
		zumbik_paine1();
	}
	// NORTH : 315-45	(fall BACKWARD)
	else {
		//if (self.debuglvl) dprint("\b[KNOCKDOWN]\b HIT from the FRONT\n");
		zumbik_paine1();
	}
};

/*============================================================================
 All sounds used
 2 = strutting the stuff (walking)
 3 = running (in slow motion)
 4 = all pain routines (zumbik_paina1, _painb1, _painc1, _paind1)
 5 = its a knockout!
 6 = get up and moan about it
 7 = sword swipe
============================================================================*/
void(float type) zumbik_sound =
{
	// check for gibbed or idle sound block
	if (self.health < 1) return;
	if (self.spawnflags & MON_SPAWN_NOIDLE && type < 3) return;
	
	// Random sound check
 	self.lip = random();
	if (type == 2 && self.idletimer < time) {
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
		if (self.lip < 0.25) sound (self, CHAN_WEAPON, "weapons/sword1a.wav", 1, ATTN_NORM);
		else if (self.lip < 0.5) sound (self, CHAN_WEAPON, "weapons/sword2a.wav", 1, ATTN_NORM);
		else if (self.lip < 0.75) sound (self, CHAN_WEAPON, "weapons/sword1b.wav", 1, ATTN_NORM);
		else sound (self, CHAN_WEAPON, "weapons/sword2b.wav", 1, ATTN_NORM);
	}
};

//============================================================================
void() zumbik_die =
{
	ZZumbiKnightDie();
	self.health = self.gibhealth; // Force gib
	monster_death_precheck();
};

/*======================================================================
 QUAKED monster_zumbik (1 0 0) (-16 -16 -24) (16 16 32) Ambush x FLOOR
======================================================================*/
void() monster_zumbik =
{
	if (deathmatch) { remove(self); return; }

	self.mdl = "progs/mon_zombiek.mdl";		// Zombie Knight
	self.headmdl = "progs/h_zombiek.mdl";
	precache_model (self.mdl);
	precache_model (self.headmdl);

	self.gib1mdl = "progs/w_zombiesword.mdl";	// Unique sword
	self.gib1sound = GIB_IMPACT_METALA;
	precache_model (self.gib1mdl);

	precache_sound ("zombie/z_idle.wav");	// Idle A
	precache_sound ("zombie/z_idle1.wav");	// Idle B

	self.pain_sound = "zombie/z_pain.wav";
	self.pain_sound2 = "zombie/z_pain1.wav";
	precache_sound (self.pain_sound);
	precache_sound (self.pain_sound2);

	precache_sound ("zombie/z_fall.wav");	// Impact - floor
	precache_sound ("zombie/z_gib.wav");	// Death sound

	// New sword sweep/slash sounds
	precache_sound ("weapons/sword1a.wav");
	precache_sound ("weapons/sword1b.wav");
	precache_sound ("weapons/sword2a.wav");
	precache_sound ("weapons/sword2b.wav");

	// New sight sound, mixture of knight + zombie
	self.sight_sound = "zombie/zk_sight.wav";
	precache_sound (self.sight_sound);

	// Check for poisonous entity flag
	if (self.poisonous) {
		precache_poisongibs();			// precache gibs
		self.gibtype = GIBTYPE_POISON;	// Poisonous blood trails
		self.skin = self.exactskin = self.gib1skin = 1;
	}

	self.solid = SOLID_NOT;				// No interaction with world
	self.movetype = MOVETYPE_NONE;		// Static item, no movement
	if (self.bboxtype < 1) self.bboxtype = BBOX_SHORT;
	self.health = g_zombie_health;   	// Basic health (cannot override)
	self.gibhealth = -60;				// Gib value, not used
	self.gibbed = FALSE;				// In one piece
	self.pain_flinch = MONAI_ZOMBIEHGH_DAM;
	self.steptype = FS_TYPESLOW;		// Small leg
	self.altsteptype = FS_TYPEDRAG;		// Clubfoot
	self.pain_timeout = -5;				// Always go into pain (health reset)
	self.inpain = 0;					// Zombie starts with no pain lock
	self.count = 0;						// Reset get up timer
	self.deathstring = " was cornered by a Zombie Knight\n";

	// Always reset Ammo Resistance to be consistent
	self.resist_shells = self.resist_nails = 0;
	self.resist_rockets = self.resist_cells = 0;

	self.th_checkattack = ZombiekCheckAttack;
	self.th_stand = zumbik_stand1;
	self.th_walk = zumbik_walk1;
	self.th_run = zumbik_run1;
	self.th_melee = zumbik_melee;		// two melee attacks (stationary)
	self.th_jump = zumbik_jump1;		// Leap attack
	self.th_jumpexit = zumbik_jump9;	// Exit animation for jump
	self.th_pain = zumbik_pain;
	self.th_die = zumbik_die;
	self.th_wakeup = zumbik_wakeup;	// Get off floor
	
	self.classtype = CT_MONZOMBIEK;
	self.classgroup = CG_ZOMBIE;		// One big happy zombie family!
	self.classmove = MON_MOVEWALK;

	monster_start();
};
