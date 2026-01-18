local wezterm = require('wezterm')
local platform = require('utils.platform')

local font_family = 'LigaMonaco Nerd Font'
local font_size = platform.is_mac and 16 or 14

return {
   font = wezterm.font({
      family = font_family,
      weight = 'Regular',
      style = 'Italic',
   }),
   font_size = font_size,

   -- 禁用粗体增强
   bold_brightens_ansi_colors = false,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Light', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Light', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
