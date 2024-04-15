neogeopalsurf = -1;
neogeopalstart = 0;
linestosee = 1024;
firstrun = true;
doneprocess = false;
framecount = 0;
side_length = 16;
//s = 4; // screen render scale

ini_open("Settings/preferences.ini");
finalpath = ini_read_string("Path", "Last", working_directory);
maxpngwidth  = max(16, real(ini_read_string("PNG", "Maximum width",  "4096")));
maxpngheight = max(16, real(ini_read_string("PNG", "Maximum height", "4096")));
ini_write_string("PNG", "Warning",  "Too small numbers will create a LOT of files! Values will be clamped between 16 and 4096");
ini_write_string("PNG", "Maximum width",  string(maxpngwidth));
ini_write_string("PNG", "Maximum height", string(maxpngheight));
ini_close();

var title = "Open a file to view as Neo Geo palette";
var str = "Neo Geo file|*.*"; //.pal)|*.pal";
filepath = get_open_filename_ext(str, "", finalpath, title);
if filepath != ""
{
	var file = file_bin_open(filepath, 0);
	
	finalpath = filename_path(finalpath);
	
	ini_open("Settings/preferences.ini");
	ini_write_string("Path", "Last", filename_path(filepath));
	ini_close();
	
	realfilesize = file_bin_size(file);
	file_bin_seek(file, buffer_seek_start);
	filebuff = buffer_create(realfilesize, buffer_fast, 1);
	buffer_seek(filebuff, buffer_seek_start, 0);
	for (var i = 0; i < realfilesize; i++)
		buffer_write(filebuff, buffer_u8, file_bin_read_byte(file));
	
	file_bin_close(file);
	
	//smallbuff = buffer_create(linestosee * 32, buffer_fast, 1);
}

