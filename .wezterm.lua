local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 140
config.initial_rows = 40

config.font = wezterm.font('JetBrains Mono')
config.font_size = 13
config.color_scheme = 'Tokyo Night (Gogh)'

config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}
config.enable_scroll_bar = false

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.status_update_interval = 500
wezterm.on("update-status", function(window, pane)
	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			cwd = basename(cwd.file_path)
		else
			cwd = basename(cwd)
		end
	else
		cwd = ""
	end

	-- Current command
	local cmd = pane:get_foreground_process_name()
	cmd = cmd and basename(cmd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M:%S")

	-- Right status
	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

return config
