# Colorizer
Colorize gtk and xfwm theme from .Xresources


## Dependencies
- Inkscape (to render assets in gtk theme)

## Usage
<pre>
$ ./colorizer.sh
                                    
 _____     _         _             
|     |___| |___ ___|_|___ ___ ___ 
|   --| . | | . |  _| |- _| -_|  _|
|_____|___|_|___|_| |_|___|___|_|  
                                   


Usage : colorizer [options #optional]

Avaible options
--wal       Generate color from pywal cache
--gtk       Choose gtk theme from list [ fantome ]
--xfwm      Choose xfwm4 theme from list [ pastel | black-paha | one_new | nest1 | diamondo | wendows ]
--help      Show help
</pre>

To generate gtk theme and xfwm4 theme, use:
<pre>
$ ./colorizer.sh --wal --gtk fantome --xfwm [ pastel | black-paha | one_new | nest1 | diamondo | wendows ]
</pre>
To generate only xfwm4 theme, use:
<pre>
$ ./colorizer.sh --wal --xfwm [ pastel | black-paha | one_new | nest1 | diamondo | wendows ]
</pre>
remember to choose only one xfwm theme, and not using bracket
example:
<pre>
$ ./colorizer.sh --wal --xfwm pastel
</pre>
or

<pre>
$ ./colorizer.sh --wal --xfwm diamondo
</pre>

## Gallery

![Dark gtk 2](Screenshots/dark-gtk2.png)
![Dark gtk 3](Screenshots/dark-gtk3.png)
![xfwm diamondo](Screenshots/dark-diamondo.png)
![xfwm pastel](Screenshots/dark-pastel.png)
![xfwm black-paha](Screenshots/dark-black-paha.png)
![xfwm new_one](Screenshots/dark-new_one.png)
![xfwm nest1](Screenshots/dark-nest1.png)
![xfwm wendows](Screenshots/dark-wendows.png)

![Light gtk 2](Screenshots/light-gtk2.png)
![Light gtk 3](Screenshots/light-gtk3.png)
![xfwm diamondo](Screenshots/light-diamondo.png)
![xfwm pastel](Screenshots/light-pastel.png)
![xfwm black-paha](Screenshots/light-black-paha.png)
![xfwm new_one](Screenshots/light-new_one.png)
![xfwm nest1](Screenshots/light-nest1.png)
![xfwm wendows](Screenshots/light-wendows.png)

## Credits
- inspired by obtgen by [Fikri Omar](https://github.com/fikriomar16/obtgen/)
- xfwm theme from [Faat Fuut](https://github.com/Nztux/fuut-xfwm.xfce-theme-Collections)
- fantome gtk theme from [Adhi Pambudi](https://github.com/addy-dclxvi/gtk-theme-collections/)
- diamondo xfwm theme inspired by [Circela xfwm theme ](https://github.com/addy-dclxvi/xfwm4-theme-collections)
- xfwm theme from [Wotalim](https://github.com/wotalim/sora-aoi)