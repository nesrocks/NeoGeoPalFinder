

	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	var xx = 40;
	var yy = 40;
	
	var i = 0;
	//draw_text(xx, yy + (16 * i++), filepath);
	//draw_text(xx, yy + (16 * i++), string(linestosee) + " " + string(neogeopalstart) + " / " + string(realfilesize));
	//draw_text(xx, yy + (16 * i++), string(neogeopalstart) + " / " + string(realfilesize));
	//draw_text(xx, yy + (16 * i++), "keys: N, M, H, J");
	if filepath != ""
	{
		if doneprocess
		{
			draw_set_color(c_lime);
			draw_text(xx, yy + (32 * i++), "Status: Image(s) created!");
			draw_set_color(c_white);
			draw_text(xx, yy + (32 * i++), "File: " + string(filepath));
			draw_text(xx, yy + (32 * i++), "Size: " + string(realfilesize/32) + " possible palettes of 16 colors each");
			draw_text(xx, yy + (32 * i++), "PNG file: " + string(finalpath));
			draw_text(xx, yy + (32 * i++), "PNG size: " + string(side_length) + " x " + string(side_length));
		}
		else
		{
			draw_set_color(c_lime);
			draw_text(xx, yy + (32 * i++), "Status: Processing...");
			draw_set_color(c_white);
			draw_text(xx, yy + (32 * i++), "File: " + string(filepath));
			draw_text(xx, yy + (32 * i++), "Size: " + string(realfilesize/32) + " possible palettes of 16 colors each");
		}
	}
	if filepath == ""
	or doneprocess
	{
		draw_set_color(c_lime);
		draw_text(xx, yy + (32 * i++), "Status: Please pick a file");
		draw_set_color(c_gray);
		draw_text(xx, yy + (32 * i++), "Press C: copy the PNG path to the clipboard");
		draw_text(xx, yy + (32 * i++), "Press ENTER: pick a file to convert");
		draw_text(xx, yy + (32 * i++), "Press ESC: close the program");
	}

exit;
/*
if filepath == "" exit;
if surface_exists(neogeopalsurf)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
	
	var size = 128;
	
	for (var h = 0; h < surface_get_height(neogeopalsurf) / size; h++)
		draw_surface_part_ext(neogeopalsurf, 0, h * size, surface_get_width(neogeopalsurf), size, (s * 16) * h, 0, s, s, c_white, 1);
	
	//draw_set_font(retrofont);
	draw_set_color(c_white);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	var xx = window_get_width() - 10;
	var yy = 10;
	
	var i = 0;
	draw_text(xx, yy + (16 * i++), filepath);
	draw_text(xx, yy + (16 * i++), string(linestosee) + " " + string(neogeopalstart) + " / " + string(realfilesize));
	draw_text(xx, yy + (16 * i++), string(neogeopalstart) + " / " + string(realfilesize));
	draw_text(xx, yy + (16 * i++), "keys: N, M, H, J");
	draw_text(xx, yy + (16 * i++), "press esc to close the viewer");
	
}