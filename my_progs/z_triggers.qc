void() shop_area_touch =
{
    if (other.classname != "player") return;

    if (self.attack_finished > time)
		return;

	self.attack_finished = time + 2;

    local string msg;
    local entity t = find(world, targetname, self.target);
    if (t.count != -1 && t.state >= t.count)
    {
        msg = t.message;
    }
    else if (t.item == ITEM_WEAPON_SUPER_SHOTGUN)
    {
        if (!(other.items & IT_SUPER_SHOTGUN))
        {
            msg = "Buy Super Shotgun for Q$90";
        }
        else
        {
            msg = "Buy shells for Q$45";
        }
    }
    else if (t.item == ITEM_WEAPON_NAILGUN)
    {
        if (!(other.items & IT_NAILGUN))
        {
            msg = "Buy Nailgun for Q$100";
        }
        else
        {
            msg = "Buy nails for Q$50";
        }
    }
    else if (t.item == ITEM_WEAPON_NAILGUN)
    {
        if (!(other.items & IT_NAILGUN))
        {
            msg = "Buy Super Nailgun for Q$125";
        }
        else
        {
            msg = "Buy nails for Q$50";
        }
    }
    else if (t.item == ITEM_WEAPON_RANDOM)
    {
        msg = "Rent weapon for Q$80";
    }
    else if (t.item == ITEM_MEDKIT)
    {
        msg = "Buy medkit for Q$25";
    }
    else if (t.item == ITEM_ARMOR_BASIC)
    {
        msg = "Buy basic armor for Q$50";
    }
    else if (t.item == ITEM_SILVER_KEY)
    {
        msg = strcat("Buy silver key for Q$", ftos(PRICE_SILVER_KEY));
    }
    else if (t.item == ITEM_GOLD_KEY)
    {
        msg = strcat("Buy gold key for Q$", ftos(PRICE_GOLD_KEY));
    }

    centerprint (other, strcat(msg, "\n"));
	sound (other, CHAN_BODY, "misc/talk.wav", 1, ATTN_NORM);
};

/*QUAKED trigger_shop_area
Displays a message with the item available to buy and it's price
-------- KEYS --------
item    : The item available to buy
*/
void() trigger_shop_area =
{
    precache_sound ("misc/talk.wav");
    InitTrigger();
    self.touch = shop_area_touch;
};