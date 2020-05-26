.float wavenum;
.float waveactive;
.float credit;
.float creditdiff;
.float creditdifftime;
.float item;
.entity zspecentity;

// callback funcs to call from non-zquake code
void() ZClientConnect;

float() ZCanClientRespawn;

void() ZClientRespawn;

void() ZPlayerPreThink;

void() ZMonsterDie;

float(float v) ZRunSpeedIncrease;

void() EndWaveCheat;