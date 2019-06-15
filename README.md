<div align="center">
	<h1>warnai</h1>
	<p>Swiss army theme changer from .Xresources</p>
</div>


## Dependencies
- Inkscape (to render assets in gtk theme)
- optipng
- python3

## Usage
<pre>
$ ./warnai                                

Usage : warnai [options #parameter]

Avaible options
--wal     | -w    Generate color from pywal cache
--xcolor  | -xc   Generate color from custom .Xresources file
--gtk     | -g    Choose gtk theme from list [ fantome ]
--xfwm    | -xf   Choose xfwm4 theme from list [ pastel | black-paha | one_new | nest1 | diamondo | wendows | tetris | ribbon | just-title-bar | 365 | vela ]
--openbox | -ob   Choose openbox theme from list [ pelangi | tricky | mek-oes | small-tb | medium-tb | large-tb | small-border | medium-border | slight | slight-medium ]
--tint2   | -t    Choose tint2 theme from list [ chromeos | chromeos-tinted | chromeos-pelangi | slim-text-dark | slim-text-tinted | slim-text-tinted-dark | floaty-rounded | floaty | slim-float | minima-rounded | less-is-more | chrome-os ]
--norender| -n    Used with --gtk to stop it from rendering assets
--help    | -h    Show help
</pre>

To generate gtk theme and xfwm4 theme with wal color scheme use:
<pre>
$ ./warnai --wal --gtk fantome --xfwm [ pastel | black-paha | one_new | nest1 | diamondo | wendows ]
</pre>
To generate only xfwm4 theme with wal color scheme use:
<pre>
$ ./warnai --wal --xfwm [ pastel | black-paha | one_new | nest1 | diamondo | wendows ]
</pre>

Remember to choose only one xfwm theme and not using bracket

### Example:
To generate pastel xfwm theme
<pre>
$ ./warnai --xfwm pastel
</pre>
To generate mek-oes openbox theme and chrome-os tint2 theme using custom .Xresources file
<pre>
$ ./warnai -xc /path/to/.Xresources -ob mek-oes -t chrome-os
</pre>

## Demo
Click image to go to youtube video
[![Warnai demo](https://i.imgur.com/6582WcX.jpg)](http://www.youtube.com/watch?v=0yhTC4929gk "Warnai demo")

## Credits
- inspired by obtgen by [Fikri Omar](https://github.com/fikriomar16/obtgen/)
- xfwm theme from [Faat Fuut](https://github.com/Nztux/fuut-xfwm.xfce-theme-Collections)
- fantome gtk theme from [Adhi Pambudi](https://github.com/addy-dclxvi/gtk-theme-collections/)
- diamondo xfwm theme inspired by [Circela xfwm theme ](https://github.com/addy-dclxvi/xfwm4-theme-collections)
- xfwm theme from [Wotalim](https://github.com/wotalim/sora-aoi)
- openbox theme pelangi by [Adhi Pambudi](https://github.com/addy-dclxvi/openbox-theme-collections)

## Buy me a ko-fi
[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/V7V0XBC5)