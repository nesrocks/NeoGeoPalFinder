function NeoGeoGenPalPngs()
{
	show_debug_message("gen pngs")
	//var filesize = min(realfilesize, 2 * wh * wh);
	//filesize = min(filesize, realfilesize - neogeopalstart);
	var filesize = realfilesize;
	
	var linenum = floor(filesize / 32);
	//linenum = linenum - (linenum mod 2);
	
	if linenum <= 0 exit;
	
	// Step 1: Find the smallest power of 2 greater than or equal to the square root of n (free chatgpt got one right)
    side_length = max(16, power(2, ceil(log2(sqrt(filesize / 2)))));
    
	var ww = min(side_length, maxpngwidth);
	var hh = min(side_length, maxpngheight);
	var fullsurf = surface_create(ww, hh);
	surface_set_target(fullsurf);
	
	var pagesize = 2 * ww * hh; // each 2 bytes = 1 pixel;
	
	
	var linecounter = 0;
	var maxcolumns = ww / 16;
	
	var pagenum = filesize / pagesize;
	
	for (var shifted = 0; shifted < 2; shifted++)
	{
		buffer_seek(filebuff, buffer_seek_start, 0);
		
		if shifted
		{
			var valueL = buffer_read(filebuff, buffer_u8);
			linenum--;
		}
		
		// do a png at a time, width and height are "wh"
		for (var page = 0; page < pagenum; page++)
		{
			linecounter = 0;
			// do a column at a time
			for (var c = 0; c < maxcolumns; c++)
			{
				// do lines
				for (var i = 0; i < (hh * 2); i += 2)
				{
					if linecounter < linenum
					{
						// transform bytes...
						for (var j = 0; j < 32; j += 2)
						{
							var valueH = buffer_read(filebuff, buffer_u8);
							var valueL = buffer_read(filebuff, buffer_u8);
							
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
						
							// ...into pixels
							draw_set_color(make_color_rgb(RR * 8, GG * 8, BB * 8));
							draw_point((c * 16) + ( j / 2), i / 2);
						}
						
						linecounter++;
					}
				}
			}
			
			var purename = filename_name(filepath);
			var extensionsize = string_length(filename_ext(purename));
			purename = string_copy(purename, 1, string_length(purename) - extensionsize);
			
			if pagenum > 1
				var name = "";
			else var name = purename;
			var extra = "";
			if pagenum > 1 extra = "page_" + string(page);
			if shifted extra += " (shifted)";
			if page != 0 extra += (" offset " + string(page * pagesize));
			var fullname = name + extra + ".png"
			if pagenum > 1 surface_save(fullsurf, purename + "/" + fullname);
			else surface_save(fullsurf, fullname);
			finalpath = filename_path(fullname);
		}
	}
	
	surface_reset_target();
	surface_free(fullsurf);
	doneprocess = true;
}