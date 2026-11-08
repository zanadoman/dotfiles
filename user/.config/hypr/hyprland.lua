hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XCURSOR_THEME", "ArcMidnight-cursors")
hl.env("XCURSOR_SIZE", "24")

hl.monitor {
    output = "eDP-1",
    mode = "1920x1200@165.0",
    position = "0x0",
    scale = 1,
}

hl.monitor {
    output = "HDMI-A-1",
    mode = "1920x1080@60.0",
    position = "1920x0",
    scale = 1,
}

local function setup_workspaces()
    hl.workspace_rule { workspace = "1", monitor = "HDMI-A-1" }
    hl.workspace_rule { workspace = "2", monitor = "eDP-1" }
    hl.workspace_rule { workspace = "3", monitor = "HDMI-A-1" }
    hl.workspace_rule { workspace = "4", monitor = "eDP-1" }
    hl.workspace_rule { workspace = "5", monitor = "HDMI-A-1" }
    hl.workspace_rule { workspace = "6", monitor = "eDP-1" }
    hl.workspace_rule { workspace = "7", monitor = "HDMI-A-1" }
    hl.workspace_rule { workspace = "8", monitor = "eDP-1" }
    hl.workspace_rule { workspace = "9", monitor = "HDMI-A-1" }
end

if #hl.get_monitors() == 2 then
    setup_workspaces();
end

hl.on("monitor.added", setup_workspaces);

hl.on("monitor.removed", function()
    hl.workspace_rule { workspace = "1", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "2", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "3", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "4", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "5", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "6", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "7", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "8", monitor = "eDPI-1" }
    hl.workspace_rule { workspace = "9", monitor = "eDPI-1" }
end)

hl.on("hyprland.start", function()
    hl.exec_cmd "hypridle"
    hl.exec_cmd "brightnessctl s 25%"
    hl.exec_cmd "hyprsunset -t 5500"
    hl.exec_cmd "swaybg -i $HOME/.config/hypr/wallpaper.jpg"
    hl.exec_cmd "gsettings set org.gnome.desktop.interface gtk-theme Tokyonight-Dark"
    hl.exec_cmd "gsettings set org.gnome.desktop.interface icon-theme TokyoNight-SE"
    hl.exec_cmd "gsettings set org.gnome.desktop.interface font-name 'Hack Nerd Font 10'"
    hl.exec_cmd "gsettings set org.gnome.desktop.interface cursor-theme ArcMidnight-cursors"
    hl.exec_cmd "waybar"
    hl.exec_cmd "nm-applet"
end)

hl.config {
    general = {
        gaps_out = 10,
        col = {
            inactive_border = "rgb(565f89)",
            active_border = "rgb(27a1b9)"
        }
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = false
        }
    },
    input = {
        kb_layout = "hu",
        follow_mouse = 2,
        touchpad = {
            disable_while_typing = false,
            natural_scroll = true
        }
    },
    misc = {
        disable_hyprland_logo = true,
        enable_anr_dialog = false
    },
    cursor = {
        no_hardware_cursors = true
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true
    },
    dwindle = {
        force_split = 2,
        preserve_split = true
    }
}

hl.animation {
    leaf = "global",
    enabled = true,
    speed = 2,
    bezier = "default"
}

local mod = "SUPER"
local alt = "ALT"

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd "$TERMINAL")
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mod .. " + SHIFT + ESCAPE", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + mouse:273", hl.dsp.window.float { action = "toggle" })
hl.bind(alt .. " + SHIFT + mouse:273", hl.dsp.window.float { action = "toggle" })
hl.bind(mod .. " + D", hl.dsp.exec_cmd "fuzzel")
hl.bind(mod .. " + E", hl.dsp.layout "togglesplit")
hl.bind(mod .. " + F", hl.dsp.window.fullscreen { mode = "maximized" })
hl.bind("F11", hl.dsp.window.fullscreen { mode = "fullscreen" })
hl.bind(mod .. " + B", hl.dsp.exec_cmd "$BROWSER")
hl.bind("PRINT", hl.dsp.exec_cmd "grimshot")
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd "grimshot")

hl.bind(mod .. " + LEFT", function()
    local workspace = hl.get_active_special_workspace()
    if workspace and workspace.name == "special:magic" then
        hl.dispatch(hl.dsp.layout "focus left")
    else
        hl.dispatch(hl.dsp.focus { direction = "left" })
    end
end)
hl.bind(mod .. " + RIGHT", function()
    local workspace = hl.get_active_special_workspace()
    if workspace and workspace.name == "special:magic" then
        hl.dispatch(hl.dsp.layout "focus right")
    else
        hl.dispatch(hl.dsp.focus { direction = "right" })
    end
end)
hl.bind(mod .. " + UP", hl.dsp.focus { direction = "up" })
hl.bind(mod .. " + DOWN", hl.dsp.focus { direction = "down" })

hl.bind(mod .. " + SHIFT + LEFT", function()
    local workspace = hl.get_active_special_workspace()
    if workspace and workspace.name == "special:magic" then
        hl.dispatch(hl.dsp.layout "swapcol l")
    else
        hl.dispatch(hl.dsp.window.move { direction = "left" })
    end
end)
hl.bind(mod .. " + SHIFT + RIGHT", function()
    local workspace = hl.get_active_special_workspace()
    if workspace and workspace.name == "special:magic" then
        hl.dispatch(hl.dsp.layout "swapcol r")
    else
        hl.dispatch(hl.dsp.window.move { direction = "right" })
    end
end)
hl.bind(mod .. " + SHIFT + UP", hl.dsp.window.move { direction = "up" })
hl.bind(mod .. " + SHIFT + DOWN", hl.dsp.window.move { direction = "down" })
hl.bind(mod .. " + SHIFT + mouse:272", hl.dsp.window.drag())

hl.bind(alt .. " + SHIFT + LEFT", hl.dsp.window.resize { x = -50, y = 0, relative = true })
hl.bind(alt .. " + SHIFT + RIGHT", hl.dsp.window.resize { x = 50, y = 0, relative = true })
hl.bind(alt .. " + SHIFT + UP", hl.dsp.window.resize { x = 0, y = -50, relative = true })
hl.bind(alt .. " + SHIFT + DOWN", hl.dsp.window.resize { x = 0, y = 50, relative = true })
hl.bind(alt .. " + SHIFT + mouse:272", hl.dsp.window.resize())

hl.bind(mod .. " + 1", hl.dsp.focus { workspace = 1 })
hl.bind(mod .. " + 2", hl.dsp.focus { workspace = 2 })
hl.bind(mod .. " + 3", hl.dsp.focus { workspace = 3 })
hl.bind(mod .. " + 4", hl.dsp.focus { workspace = 4 })
hl.bind(mod .. " + 5", hl.dsp.focus { workspace = 5 })
hl.bind(mod .. " + 6", hl.dsp.focus { workspace = 6 })
hl.bind(mod .. " + 7", hl.dsp.focus { workspace = 7 })
hl.bind(mod .. " + 8", hl.dsp.focus { workspace = 8 })
hl.bind(mod .. " + 9", hl.dsp.focus { workspace = 9 })
hl.bind(mod .. " + 0", hl.dsp.workspace.toggle_special "magic")

hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move { workspace = 1, follow = false })
hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move { workspace = 2, follow = false })
hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move { workspace = 3, follow = false })
hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move { workspace = 4, follow = false })
hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move { workspace = 5, follow = false })
hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move { workspace = 6, follow = false })
hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move { workspace = 7, follow = false })
hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move { workspace = 8, follow = false })
hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move { workspace = 9, follow = false })
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move { workspace = "special:magic", follow = false })

hl.bind(alt .. " + SHIFT + 1", hl.dsp.window.move { workspace = 1 })
hl.bind(alt .. " + SHIFT + 2", hl.dsp.window.move { workspace = 2 })
hl.bind(alt .. " + SHIFT + 3", hl.dsp.window.move { workspace = 3 })
hl.bind(alt .. " + SHIFT + 4", hl.dsp.window.move { workspace = 4 })
hl.bind(alt .. " + SHIFT + 5", hl.dsp.window.move { workspace = 5 })
hl.bind(alt .. " + SHIFT + 6", hl.dsp.window.move { workspace = 6 })
hl.bind(alt .. " + SHIFT + 7", hl.dsp.window.move { workspace = 7 })
hl.bind(alt .. " + SHIFT + 8", hl.dsp.window.move { workspace = 8 })
hl.bind(alt .. " + SHIFT + 9", hl.dsp.window.move { workspace = 9 })
hl.bind(alt .. " + SHIFT + 0", hl.dsp.window.move { workspace = "special:magic" })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })

hl.window_rule { match = { class = "" }, float = true }
hl.window_rule { match = { class = "org\\.pulseaudio\\.pavucontrol" }, float = true, opacity = 0.95 }
hl.window_rule { match = { class = "nm-connection-editor" }, float = true, opacity = 0.95 }
hl.window_rule { match = { class = "nm-applet" }, opacity = 0.95 }
hl.window_rule { match = { class = "Emulator" }, float = true, border_size = 0, rounding = 0 }
hl.workspace_rule { workspace = "special:magic", gaps_out = 50, layout = "scrolling" }
