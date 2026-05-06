#!/usr/bin/env luajit

local user = os.getenv("USER")
local pwd = os.getenv("PWD")
local host = os.getenv("HOST")

local red = "#e06c75"
local orange = "#d19a66"
local green = "#98c379"
local black = "#282c34"

if not host then
    local f = io.popen("hostname")
    host = f:read("*a"):gsub("%s+$", "")
    f:close()
end

local function make_pill(content, bg, fg, end_pill)
    if end_pill then
        return ("%%F{%s}%%K{%s}%%F{%s} %s %%k%%F{%s}%%f"):format(bg, bg, fg, content, bg)
    end
    return ("%%F{%s}%%K{%s}%%F{%s} %s %%k%%f"):format(bg, bg, fg, content)
end

local function make_segment(content, bg, fg, next_bg)
    local separator = ""
    
    -- 1. Paint the segment background and text
    local segment = ("%%K{%s}%%F{%s} %s "):format(bg, fg, content)
    
    -- 2. Paint the separator: 
    -- Foreground = current BG, Background = next BG (or reset if last)
    local sep_color = ""
    if next_bg then
        sep_color = ("%%K{%s}%%F{%s}"):format(next_bg, bg)
    else
        sep_color = ("%%k%%F{%s}"):format(bg)
    end
    
    return segment .. sep_color .. separator .. "%%f%%k"
end

local function get_os_icon()

    local icons = {
        nixos = " ",
    }

    local f = io.open("/etc/os-release", "r")
    if not f then return " ", "Linux" end

    local content = f:read("*all")
    f:close()

    local os_id = content:match('\nID=([^%s\n]+)') or ""
    os_id = os_id:gsub('"', '')

    return icons[os_id] or " "

end

local os_pill = make_pill(get_os_icon(), green, black, false)
local user_pill = make_pill(" " .. user .. "@" .. host, red, black, true)

local prompt = os_pill .. user_pill .. [[

❯ ]]

print(prompt)


--[[ base00: "#282c34"
  base01: "#353b45"
  base02: "#3e4451"
  base03: "#545862"
  base04: "#565c64"
  base05: "#abb2bf"
  base06: "#b6bdca"
  base07: "#c8ccd4"
  base08: "#e06c75"
  base09: "#d19a66"
  base0A: "#e5c07b"
  base0B: "#98c379"
  base0C: "#56b6c2"
  base0D: "#61afef"
  base0E: "#c678dd"
  base0F: "#be5046" ]]