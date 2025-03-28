#!/usr/bin/env lua

local keybinds = {
	"󰄛 Kitty: Ctrl+Alt+K",
	"󰈆 Kill Active: Win+Alt+C",
	" Exit Hyprland: Win+M",
	" File Manager: Ctrl+E",
	" Toggle Floating: Win+V",
	"󰀻 Walker: Alt+Space",
	"󱈶 Kill Waybar: Ctrl+Alt+9",
	"󰁱 Waybar: Ctrl+Alt+0",
	"󰕧 OBS: Ctrl+Alt+O",
}

local tooltip_text = table.concat(keybinds, "\n")

print(tooltip_text)
