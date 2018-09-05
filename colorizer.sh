file=$HOME/.Xresources
dir=$HOME/.themes/colorizer/
pwd=/usr/bin/pwd

while [[ "$#" > 0 ]]; do case $1 in
  -w|--wal) wal=1;;
  -g|--gtk) gtk="$2"; shift;;
  -x|--xfwm) xfwm="$2"; shift;;
  -o|--openbox) openbox="$2"; shift;;
  -h|--help) help=1;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done

fill_color(){
        get_colors(){
                grep "color$1 *:" $file | awk -F\# '{print $2}' | head -1
        }
        get_colors_bg=`grep "background *:" $file | awk -F\# '{print $2}' | head -1`
}

xfwm_themer(){
	if [ ! -d "$dir"xfwm4/ ]; then
	    mkdir -p "$dir"xfwm4/
	else
		rm "$dir"xfwm4/*
	fi	
	cp `$pwd`/xfwm4/$1/* "$dir"xfwm4/
	sed -i s/"color_bg"/"${get_colors_bg}"/g "$dir"xfwm4/*
	sed -i s/"color_1"/"$(get_colors 1)"/g "$dir"xfwm4/*
	sed -i s/"color_2"/"$(get_colors 2)"/g "$dir"xfwm4/*
	sed -i s/"color_3"/"$(get_colors 3)"/g "$dir"xfwm4/*
	sed -i s/"color_4"/"$(get_colors 4)"/g "$dir"xfwm4/*
	sed -i s/"color_5"/"$(get_colors 5)"/g "$dir"xfwm4/*
	sed -i s/"color_6"/"$(get_colors 6)"/g "$dir"xfwm4/*
	sed -i s/"color_7"/"$(get_colors 7)"/g "$dir"xfwm4/*
	cp -r `$pwd`/xfce-notify-4.0 "$dir"
	sed -i s/"color_bg"/"${get_colors_bg}"/g "$dir"xfce-notify-4.0/*
	sed -i s/"color_1"/"$(get_colors 1)"/g "$dir"xfce-notify-4.0/*
	sed -i s/"color_2"/"$(get_colors 2)"/g "$dir"xfce-notify-4.0/*
	sed -i s/"color_3"/"$(get_colors 3)"/g "$dir"xfce-notify-4.0/*
	sed -i s/"color_4"/"$(get_colors 4)"/g "$dir"xfce-notify-4.0/*
	sed -i s/"color_5"/"$(get_colors 5)"/g "$dir"xfce-notify-4.0/*
	sed -i s/"color_6"/"$(get_colors 6)"/g "$dir"xfce-notify-4.0/*
	sed -i s/"color_7"/"$(get_colors 7)"/g "$dir"xfce-notify-4.0/*
}

gtk_themer(){
	rm -rf "$dir"gtk-*
	cp -r `$pwd`/gtk/$1/* "$dir"
	find "$dir"gtk-2.0/ -type f -exec sed -i s/"color_bg"/"${get_colors_bg}"/g {} \;
	find "$dir"gtk-2.0/ -type f -exec sed -i s/"color_2"/"$(get_colors 2)"/g {} \;
	find "$dir"gtk-2.0/ -type f -exec sed -i s/"color_1"/"$(get_colors 1)"/g {} \;
	find "$dir"gtk-2.0/ -type f -exec sed -i s/"color_7"/"$(get_colors 7)"/g {} \;
	find "$dir"gtk-2.0/menubar-toolbar/ -type f -exec sed -i s/"color_bg"/"${get_colors_bg}"/g {} \;
	find "$dir"gtk-2.0/menubar-toolbar/ -type f -exec sed -i s/"color_2"/"$(get_colors 2)"/g {} \;
	find "$dir"gtk-2.0/menubar-toolbar/ -type f -exec sed -i s/"color_7"/"$(get_colors 7)"/g {} \;
	find "$dir"gtk-3.0/ -type f -exec sed -i s/"color_bg"/"${get_colors_bg}"/g {} \;
	find "$dir"gtk-3.0/ -type f -exec sed -i s/"color_2"/"$(get_colors 2)"/g {} \;
	find "$dir"gtk-2.0/ -type f -exec sed -i s/"color_1"/"$(get_colors 1)"/g {} \;
	find "$dir"gtk-3.0/ -type f -exec sed -i s/"color_7"/"$(get_colors 7)"/g {} \;
	find "$dir"gtk-3.0/ -type f -exec sed -i s/"color_8"/"$(get_colors 8)"/g {} \;
}

apply_theme(){
	echo Applying theme
	xfconf-query -c xfwm4 -p /general/theme -s "adwaita"
	xfconf-query -c xfwm4 -p /general/theme -s "colorizer"
	xfconf-query -c xsettings -p /Net/ThemeName -s "adwaita"
	xfconf-query -c xsettings -p /Net/ThemeName -s "colorizer"
}

main_wal(){
	file=$HOME/.cache/wal/colors.Xresources
	mkdir -p $HOME/.themes/colorizer
	fill_color
	if [[ $wal && $xfwm && $gtk ]]; then
		echo "Generating xfwm4 theme"
		$(xfwm_themer $xfwm)
		echo "Generating gtk theme"
		$(gtk_themer $gtk)
		cd "$dir"gtk-2.0/
		"$dir"gtk-2.0/render-assets.sh;
		cd "$dir"gtk-3.0/
		"$dir"gtk-3.0/render-assets.sh;
		apply_theme
		echo Restarting panel
		xfce4-panel -r  &> /dev/null
	elif [[ $wal && $xfwm ]]; then
		echo "Generating xfwm4 theme"
		$(xfwm_themer $xfwm)
		apply_theme
	else
		show_help
	fi
	
	#$(openbox_themer $openbox)
}

main(){
	mkdir -p $HOME/.themes/colorizer
	fill_color
	if [[ $xfwm && $gtk ]]; then
		echo "Generating xfwm4 theme"
		$(xfwm_themer $xfwm)
		echo "Generating gtk theme"
		$(gtk_themer $gtk)
		cd "$dir"gtk-2.0/
		"$dir"gtk-2.0/render-assets.sh;
		cd "$dir"gtk-3.0/
		"$dir"gtk-3.0/render-assets.sh;
		apply_theme
		echo Restarting panel
		xfce4-panel -r  &> /dev/null
	elif [[ $xfwm ]]; then
		echo "Generating xfwm4 theme"
		$(xfwm_themer $xfwm)
		apply_theme
	else
		show_help
	fi
	
	#$(openbox_themer $openbox)
}

show_help(){
	cat <<-EOF
		                                    
	 _____     _         _             
	|     |___| |___ ___|_|___ ___ ___ 
	|   --| . | | . |  _| |- _| -_|  _|
	|_____|___|_|___|_| |_|___|___|_|  
	                                   


	Usage : colorizer [options #optional]

	Avaible options
	--wal       Generate color from pywal cache
	--gtk       Choose gtk theme from list [ fantome ]
	--xfwm      Choose xfwm4 theme from list [ pastel | black-paha | one_new | nest1 | diamondo | wendows | tetris | ribbon | just-title-bar ]
	--help      Show help

	EOF
}

if [[ $help == 1 ]]; then
	show_help
elif [[ $wal == 1 ]]; then
	main_wal
else
	main
fi