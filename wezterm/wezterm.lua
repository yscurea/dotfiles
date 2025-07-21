local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "One Half Black (Gogh)"
config.scrollback_lines = 3500
config.enable_scroll_bar = true
config.default_prog = { "nu" }
config.macos_window_background_blur = 1
config.win32_system_backdrop = "Auto"
config.window_background_opacity = 1
config.window_decorations = "RESIZE"
config.text_background_opacity = 0.3
config.font = wezterm.font("RobotoMono Nerd Font Mono")
config.show_new_tab_button_in_tab_bar = false

local image_path = wezterm.home_dir .. "/Pictures/background.jpg"
config.background = {
	{
		source = {
			File = image_path,
		},
		opacity = 1,
		hsb = {
			brightness = 0.05,
		},
		vertical_align = "Middle",
		vertical_offset = "-30%",
		attachment = "Fixed",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
	},
}

config.font_size = 14
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

local act = wezterm.action

config.keys = {
	{
		key = " ",
		mods = "CTRL",
		action = act.SendKey({
			key = " ",
			mods = "CTRL",
		}),
	},
	{
		key = "Enter",
		mods = "CTRL",
		action = act.SendKey({
			key = "Enter",
			mods = "CTRL",
		}),
	},
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500
config.use_ime = true

local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
