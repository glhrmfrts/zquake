void() shop_area_touch =
{
    if (other.classname != "player") return;

    if (self.attack_finished > time)
		return;

	self.attack_finished = time + 2;

    local string message;
    local entity t = find(world, targetname, self.target);

    if (t.item == ITEM_WEAPON_SUPER_SHOTGUN)
    {
        if (!(other.items & IT_SUPER_SHOTGUN))
        {
            message = "Buy Super Shotgun for Q$90";
        }
        else
        {
            message = "Buy shells for Q$45";
        }
    }
    else if (t.item == ITEM_WEAPON_NAILGUN)
    {
        if (!(other.items & IT_NAILGUN))
        {
            message = "Buy Nailgun for Q$100";
        }
        else
        {
            message = "Buy nails for Q$50";
        }
    }
    else if (t.item == ITEM_WEAPON_NAILGUN)
    {
        if (!(other.items & IT_NAILGUN))
        {
            message = "Buy Super Nailgun for Q$125";
        }
        else
        {
            message = "Buy nails for Q$50";
        }
    }
    else if (t.item == ITEM_WEAPON_RANDOM)
    {
        message = "Rent weapon for Q$80";
    }
    else if (t.item == ITEM_MEDKIT)
    {
        message = "Buy medkit for Q$25";
    }
    else if (t.item == ITEM_ARMOR_BASIC)
    {
        message = "Buy basic armor for Q$50";
    }
    else if (t.item == ITEM_SILVER_KEY)
    {
        message = strcat("Buy silver key for Q$", ftos(PRICE_SILVER_KEY));
    }
    else if (t.item == ITEM_GOLD_KEY)
    {
        message = strcat("Buy gold key for Q$", ftos(PRICE_GOLD_KEY));
    }

    centerprint (other, strcat(message, "\n"));
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