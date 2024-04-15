framecount++;
if framecount < 5 exit;

update = false;

var step = linestosee;

if keyboard_check_pressed(ord("C"))
{
	clipboard_set_text(finalpath);
}

if keyboard_check(vk_control)
{
	if keyboard_check(vk_shift)
	{
			 if keyboard_check_pressed(ord("M")) { neogeopalstart += (step * 32); update = true; }
		else if keyboard_check_pressed(ord("N")) { neogeopalstart -= (step * 32); update = true; }
	}
	else
	{
			 if keyboard_check_pressed(ord("M")) { neogeopalstart += 32; update = true; }
		else if keyboard_check_pressed(ord("N")) { neogeopalstart -= 32; update = true; }
	}
}
else if keyboard_check(vk_shift)
{
		 if keyboard_check(ord("M")) { neogeopalstart += (step * 32); update = true; }
	else if keyboard_check(ord("N")) { neogeopalstart -= (step * 32); update = true; }
}
else
{
		 if keyboard_check(ord("M")) { neogeopalstart += 32; update = true; }
	else if keyboard_check(ord("N")) { neogeopalstart -= 32; update = true; }
}

	 if keyboard_check(ord("J")) { linestosee += 16; update = true; }
else if keyboard_check(ord("H")) { linestosee -= 16; update = true; }

if keyboard_check(vk_escape)
{
	game_end();
	exit;
}

if keyboard_check(vk_enter)
{
	game_restart();
	exit;
}

if filepath == "" exit;

neogeopalstart = clamp(neogeopalstart, 0, realfilesize - 32);
linestosee = max(linestosee, 1);

if filepath != -1
and (update or firstrun)
{
	var filesize = min(realfilesize, 32 * linestosee);
	filesize = min(filesize, realfilesize - neogeopalstart);
	//buffer_resize(smallbuff, filesize);
	
	//buffer_copy(filebuff, neogeopalstart, filesize - neogeopalstart, smallbuff, 0);
	//buffer_seek(smallbuff, buffer_seek_start, 0);
	
	var linenum = filesize/16;
	linenum = linenum - (linenum mod 2);
	
	if linenum <= 0 exit;
	/*
	var fullsurfw = 16;
		
	var fullsurf = surface_create(fullsurfw, linenum / 2);
	
	var pagesize = 32 * 1024;

	for (var page = 0; page < filesize / pagesize; page++)
	{
		buffer_copy(filebuff, neogeopalstart + (page * pagesize), filesize - neogeopalstart, smallbuff, 0);
		buffer_seek(smallbuff, buffer_seek_start, page * pagesize);
		
		for (var i = 0; i < linenum; i += 2)
		{		
			for (var j = 0; j < 32; j += 2)
			{
				var valueH = buffer_read(smallbuff, buffer_u8);
				var valueL = buffer_read(smallbuff, buffer_u8);
				
				var DA	= valueH & $80;
				var DA	= DA >> 7;
				
				var RL	= valueH & $40;
				var RL	= RL >> 6;
				
				var GL	= valueH & $20;
				var GL	= GL >> 5;
				
				var BL	= valueH & $10;
				var BL	= BL >> 4;
				
				var RH	= valueH & $F;
				
				var GH	= valueL & $F0;
				var GH	= GH >> 4;
				
				var BH	= valueL & $F;
				
				var RR	= (RH << 1) + RL;
				var GG	= (GH << 1) + GL;
				var BB	= (BH << 1) + BL;
				
				var col = make_color_rgb(RR * 8, GG * 8, BB * 8);
				draw_set_color(col);
				
				surface_set_target(fullsurf);
				draw_point(j / 2, i / 2);
				surface_reset_target();
			}
		}
		
		if !surface_exists(neogeopalsurf)
			neogeopalsurf = surface_create(fullsurfw, linenum);
		else surface_resize(neogeopalsurf, fullsurfw, linenum);
		surface_set_target(neogeopalsurf);
		draw_surface_ext(fullsurf, 0, 0, 1, 1, 0, c_white, 1);
		surface_reset_target();
		
		//draw_set_color(c_black);
		//draw_rectangle(0, 0, g.idewidth, g.ideheight, false);
		//var size = 128;
		//for (var h = 0; h < surface_get_height(neogeopalsurf) / size; h++)
		//	draw_surface_part_ext(neogeopalsurf, 0, h * size, surface_get_width(neogeopalsurf), size, 16 * h, 0, 1, 1, c_white, 1);
	}*/
	
	if firstrun NeoGeoGenPalPngs();
	
	
	//surface_free(fullsurf);
	firstrun = false;
}

