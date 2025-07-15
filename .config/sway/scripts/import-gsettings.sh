#!/bin/sh

# usage: import-gsettings
# config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
# if [ ! -f "$config" ]; then exit 1; fi

gnome_schema="org.gnome.desktop.interface"
# gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
# font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"
gsettings set "$gnome_schema" gtk-theme "WhiteSur-dark"
gsettings set "$gnome_schema" icon-theme "kora-pgrey"
gsettings set "$gnome_schema" cursor-theme "Banana"
# gsettings set "$gnome_schema" font-name "Adwaita Sans"
