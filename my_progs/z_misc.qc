
float(entity act) ZDoorShouldOpen =
{
    bprint(act.classname); bprint("\n");
    bprint(self.classname); bprint("\n");

    if (self.classname != "func_buy_door")
        return TRUE;
    if (act.classname != "player")
        return FALSE;
    if (self.state != STATE_BOTTOM)
        return TRUE;

    if (act.credit < self.credit)
    {
        centerprint(other, strcat("Open door for Q$", ftos(self.credit)));
        sound (other, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
        return FALSE;
    }

    TakeCredits(act, self.credit);
    return TRUE;
};

/*QUAKED func_buy_door
*/
void() func_buy_door =
{
    self.wait = -1;
    func_door();
};