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
    else if (t.item == ITEM_WEAPON_SHOTGUN)
    {
        if (!(other.items & IT_SHOTGUN))
        {
            msg = strcat("Buy Shotgun for Q$", ftos(PRICE_WEAPON_SHOTGUN));
        }
        else
        {
            msg = strcat("Buy shells for Q$", ftos(PRICE_AMMO_SHELLS));
        }
    }
    else if (t.item == ITEM_WEAPON_SUPER_SHOTGUN)
    {
        if (!(other.items & IT_SUPER_SHOTGUN))
        {
            msg = strcat("Buy Super Shotgun for Q$", ftos(PRICE_WEAPON_SUPER_SHOTGUN));
        }
        else
        {
            msg = strcat("Buy shells for Q$", ftos(PRICE_AMMO_SHELLS));
        }
    }
    else if (t.item == ITEM_WEAPON_NAILGUN)
    {
        if (!(other.items & IT_NAILGUN))
        {
            msg = strcat("Buy Nailgun for Q$", ftos(PRICE_WEAPON_NAILGUN));
        }
        else
        {
            msg = strcat("Buy nails for Q$", ftos(PRICE_AMMO_NAILS));
        }
    }
    else if (t.item == ITEM_WEAPON_SUPER_NAILGUN)
    {
        if (!(other.items & IT_NAILGUN))
        {
            msg = strcat("Buy Super Nailgun for Q$", ftos(PRICE_WEAPON_SUPER_NAILGUN));
        }
        else
        {
            msg = strcat("Buy nails for Q$", ftos(PRICE_AMMO_NAILS));
        }
    }
    else if (t.item == ITEM_WEAPON_RANDOM)
    {
        msg = strcat("Rent weapon for Q$", ftos(PRICE_WEAPON_RANDOM));
    }

    else if (t.item == ITEM_MEDKIT)
    {
        msg = strcat("Buy medkit for Q$", ftos(PRICE_MEDKIT));
    }
    else if (t.item == ITEM_MEDKIT_LARGE)
    {
        msg = strcat("Buy large medkit for Q$", ftos(PRICE_MEDKIT_LARGE));
    }

    else if (t.item == ITEM_ARMOR_BLUE)
    {
        msg = strcat("Buy blue armor for Q$", ftos(PRICE_ARMOR_BLUE));
    }
    else if (t.item == ITEM_ARMOR_YELLOW)
    {
        msg = strcat("Buy yellow armor for Q$", ftos(PRICE_ARMOR_YELLOW));
    }
    else if (t.item == ITEM_ARMOR_RED)
    {
        msg = strcat("Buy red armor for Q$", ftos(PRICE_ARMOR_RED));
    }

    else if (t.item == ITEM_KEY_SILVER)
    {
        msg = strcat("Buy silver key for Q$", ftos(PRICE_KEY_SILVER));
    }
    else if (t.item == ITEM_KEY_GOLD)
    {
        msg = strcat("Buy gold key for Q$", ftos(PRICE_KEY_GOLD));
    }

    centerprint (other, strcat(msg, "\n"));
	sound (other, CHAN_BODY, "misc/talk.wav", 1, ATTN_NORM);
};

/*QUAKED trigger_shop_area
Displays a message with the item available to buy and it's price
*/
void() trigger_shop_area =
{
    precache_sound ("misc/talk.wav");
    InitTrigger();
    self.touch = shop_area_touch;
};