.float wavenum;
.float waveactive;
.float zspectator;
.float credit;
.float creditdiff;
.float creditdifftime;
.float item;

// callback funcs to call from non-zquake code
void() ZClientConnect;

float() ZCanClientRespawn;

void() ZClientRespawn;

void() ZPlayerPreThink;

void() ZMonsterDie;

float(float v) ZRunSpeedIncrease;

void() EndWaveCheat;