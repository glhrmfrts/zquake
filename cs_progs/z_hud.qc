vector(vector v) sbar_align =
{
	// align to bottom of screen
	v_x = v_x + (vid_conwidth / 2);
	v_y = vid_conheight - v_y;
	return v;
};

void(vector pos, string pic, float alph, float scale) Sbar_DrawPic =
{
	local vector siz;
	siz = drawgetimagesize(pic) * scale;
	pos = sbar_align(pos);
	drawpic(pos, pic, siz, '1 1 1', alph);
};

void(vector pos, float char, float alph) Sbar_DrawCharacter =
{
	pos = sbar_align(pos);
	drawcharacter(pos, char, '8 8 0', '1 1 1', alph);
};

void(vector pos, string str, float alph,vector med,vector color) Sbar_DrawString =
{
	pos = sbar_align(pos);
	drawstring(pos, str, med, color, alph, 0);
};

void(vector pos, float num, float digits, float color, float alpha) Sbar_DrawNum =
{
	string pic, s, digit;
	float i, len, cnt;
	vector v;

	s = ftos(num);
	len = strlen(s);
	
	// draw the last 'digits' chars of s
	cnt = digits;
	if (len < digits) cnt = len;

	for (i=1; i<=cnt; i=i+1)
	{
		digit = substring(s, len - i, 1);
		if (digit == "-")
			digit = "minus";
		if (color)
			pic = strcat("gfx/anum_", digit);
		else
			pic = strcat("gfx/num_", digit);

		v = pos + ('24 0 0' * (digits - i));
		Sbar_DrawPic(v, pic, alpha,1);
	}
};

void() ZHud_Draw =
{
    local float wavenum = getstati(STAT_WAVENUM);
    local float credit = getstati(STAT_CREDIT);
    local float creditdiff = getstati(STAT_CREDITDIFF);
	local float waveactive = getstati(STAT_WAVEACTIVE);
    local float sbar_alpha = 1;

    if (creditdiff > 0)
    {
        Sbar_DrawString('-260 72', "+ Q$", 1, '8 8 0', '0 .7 0');
        Sbar_DrawString('-224 72', ftos(creditdiff), 1, '8 8 0', '0 .7 0');
    }
    else if (creditdiff < 0)
    {
        Sbar_DrawString('-248 72', "-Q$", 1, '8 8 0', '.7 0 0');
        Sbar_DrawString('-224 72', ftos(fabs(creditdiff)), 1, '8 8 0', '.7 0 0');
    }

    Sbar_DrawString('-248 48', "Q$", 1, '8 8 0', '1 .5 .2');
    Sbar_DrawString('-224 48', ftos(credit), 1, '8 8 0', '1 .5 .2');

	if (waveactive)
		Sbar_DrawString('-260 24', "W", 1, '8 8 0', '.7 0 0');
	else
		Sbar_DrawString('-260 24', "W", 1, '8 8 0', '1 .5 .2');

	if (wavenum >= 100)
		Sbar_DrawNum('-248 24', wavenum, 3, waveactive, sbar_alpha);
	else if (wavenum >= 10)
		Sbar_DrawNum('-248 24', wavenum, 2, waveactive, sbar_alpha);
	else
		Sbar_DrawNum('-248 24', wavenum, 1, waveactive, sbar_alpha);
};