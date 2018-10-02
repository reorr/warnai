file=$HOME/.Xresources
dir=$HOME/.themes/colorizer/
pwd=/usr/bin/pwd
conf=$HOME/.config/

while [[ "$#" > 0 ]]; do case $1 in
  -w|--wal) wal=1;;
  -g|--gtk) gtk="$2"; shift;;
  -x|--xfwm) xfwm="$2"; shift;;
  -ob|--openbox) openbox="$2"; shift;;
  -t|--tint2) tint2="$2"; shift;;
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

ob_themer(){
	if [ ! -d "$dir"openbox-3/ ]; then
	    mkdir -p "$dir"openbox-3/
	else
		rm "$dir"openbox-3/*
	fi	
	cp `$pwd`/openbox/$1/* "$dir"openbox-3/
	sed -i s/"color_bg"/"${get_colors_bg}"/g "$dir"openbox-3/*
	sed -i s/"color_1"/"$(get_colors 1)"/g "$dir"openbox-3/*
	sed -i s/"color_2"/"$(get_colors 2)"/g "$dir"openbox-3/*
	sed -i s/"color_3"/"$(get_colors 3)"/g "$dir"openbox-3/*
	sed -i s/"color_4"/"$(get_colors 4)"/g "$dir"openbox-3/*
	sed -i s/"color_5"/"$(get_colors 5)"/g "$dir"openbox-3/*
	sed -i s/"color_6"/"$(get_colors 6)"/g "$dir"openbox-3/*
	sed -i s/"color_7"/"$(get_colors 7)"/g "$dir"openbox-3/*
	if [[ $(cat $HOME/.config/openbox/rc.xml | grep "colorize") ]]; then
		openbox --reconfigure
	elif [[ $(which obconf) ]]; then
		obconf >/dev/null 2>&1
	fi
}

tint_themer(){
	cp "$conf"/tint2/tint2rc "$conf"/tint2/tint2rc.old
	cp `$pwd`/tint2/$1/* "$conf"tint2/
	sed -i s/"color_bg"/"${get_colors_bg}"/g "$conf"tint2/tint2rc
	sed -i s/"color_1"/"$(get_colors 1)"/g "$conf"tint2/tint2rc
	sed -i s/"color_2"/"$(get_colors 2)"/g "$conf"tint2/tint2rc
	sed -i s/"color_3"/"$(get_colors 3)"/g "$conf"tint2/tint2rc
	sed -i s/"color_4"/"$(get_colors 4)"/g "$conf"tint2/tint2rc
	sed -i s/"color_5"/"$(get_colors 5)"/g "$conf"tint2/tint2rc
	sed -i s/"color_6"/"$(get_colors 6)"/g "$conf"tint2/tint2rc
	sed -i s/"color_7"/"$(get_colors 7)"/g "$conf"tint2/tint2rc
	sed -i -E "s%\/home\/[a-zA-Z0-9_-]+\/%\/home\/${USER}\/%g" ~/.config/tint2/tint2rc
	killall tint2
	tint2 </dev/null &>/dev/null &
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
	echo Done
	notify-send "Done changing theme"
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
	elif [[ $wal && $gtk && $openbox ]]; then
		echo "Generating openbox theme"
		$(ob_themer $openbox)
		echo "Generating gtk theme"
		$(gtk_themer $gtk)
		cd "$dir"gtk-2.0/
		"$dir"gtk-2.0/render-assets.sh;
		cd "$dir"gtk-3.0/
		"$dir"gtk-3.0/render-assets.sh;
		apply_theme
	elif [[ $wal && $openbox && $tint2 ]]; then
		echo "Generating openbox theme"
		$(ob_themer $openbox)
		echo "Generating tint2 theme"
		$(tint_themer $tint2)
		apply_theme
	elif [[ $wal && $xfwm ]]; then
		echo "Generating xfwm4 theme"
		$(xfwm_themer $xfwm)
		apply_theme
	elif [[ $wal && $gtk ]]; then
		echo "Generating gtk theme"
		$(gtk_themer $gtk)
		cd "$dir"gtk-2.0/
		"$dir"gtk-2.0/render-assets.sh;
		cd "$dir"gtk-3.0/
		"$dir"gtk-3.0/render-assets.sh;
		apply_theme
	elif [[ $wal && $openbox ]]; then
		echo "Generating openbox theme"
		$(ob_themer $openbox)
		apply_theme
	elif [[ $wal && $tint2 ]]; then
		echo "Generating tint2 theme"
		$(tint_themer $tint2)
		apply_theme
	else
		show_help
	fi
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
	elif [[ $gtk && $openbox ]]; then
		echo "Generating gtk theme"
		$(gtk_themer $gtk)
		cd "$dir"gtk-2.0/
		"$dir"gtk-2.0/render-assets.sh;
		cd "$dir"gtk-3.0/
		"$dir"gtk-3.0/render-assets.sh;
		echo "Generating openbox theme"
		$(ob_themer $openbox)
		apply_theme
	elif [[ $xfwm ]]; then
		echo "Generating xfwm4 theme"
		$(xfwm_themer $xfwm)
		apply_theme
	elif [[ $gtk ]]; then
		echo "Generating gtk theme"
		$(gtk_themer $gtk)
		cd "$dir"gtk-2.0/
		"$dir"gtk-2.0/render-assets.sh;
		cd "$dir"gtk-3.0/
		"$dir"gtk-3.0/render-assets.sh;
		apply_theme
	elif [[ $openbox ]]; then
		echo "Generating openbox theme"
		$(ob_themer $openbox)
		apply_theme
	else
		show_help
	fi
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