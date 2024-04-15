# NeoGeoPalFinder
NeoGeo Palette Finder tool (converts binary files into PNGs).
May be used to visually look for possible candidates for NeoGeo palette data inside big files.

Instructions: unzip, run the executable, select any file (like a ROM or a memory save from Mame's debugger).
PNG files will be generated in the "user" folder. Path will be provided.
You may edit the maximum PNG dimensions in the ini file in the "user" folder.
Run the program and press "C" to copy the "user" folder path to the clipboard.

Understanding the PNG:
- Palette colors are arranged sequentially. Each palette is 16 colors (32 bytes from the binary file). So there is a 1x16 pixel are at the top left representing the first palette.
- Then the next palette is positioned beneath it. This goes on until the max png height is reached (this can be redefined in the ini file).
- This forms a column. The next palettes will be positioned on the next column to the right and so on.
- If there is not enough room in the image for all palettes then more pngs will be created and each will be named a page number.

This tool is written in GML. GameMaker version 2.3 was used.

Only tested on Windows but may be adapted and compiled into other platforms if a proper license is used.
