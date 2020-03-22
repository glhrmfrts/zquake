const float JUMPPAD_ABSOLUTEXY = 1;

.float jump_time;

void() func_jump_pad_touch =
{
    if (time < other.jump_time) return;

    dprint(other.classname); dprint(" hit jump pad\n");
    dprint(vtos(self.velocity)); dprint("\n");

    if (self.spawnflags & JUMPPAD_ABSOLUTEXY)
        other.velocity = self.velocity;
    else
        other.velocity = other.velocity + self.velocity;

    other.velocity_z = self.velocity_z;
    other.jump_time = time + 0.25;
};

void() func_jump_pad =
{
    self.solid = SOLID_TRIGGER;
	self.movetype = MOVETYPE_NONE;
	setmodel (self, self.model);
	setorigin (self, self.origin);
	setsize (self, self.mins , self.maxs);
    self.touch = func_jump_pad_touch;
    self.attack_finished = 0;
    if (!self.velocity)
        self.velocity = '0 0 500';
};