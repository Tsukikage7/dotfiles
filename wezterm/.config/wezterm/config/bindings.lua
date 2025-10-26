local wz = require('wezterm')
local act = wz.action
return {
   keys = {

      {
         key = 'n',
         mods = 'CMD',
         action = act.PromptInputLine {
            description = wz.format {
               { Attribute = { Intensity = 'Bold' } },
               { Foreground = { AnsiColor = 'Fuchsia' } },
               { Text = 'enter name for new workspace' },
            },
            action = wz.action_callback(function(window, pane, line)
               if line then
                  window:perform_action(
                          act.SwitchToWorkspace {
                             name = line,
                          },
                          pane
                  )
               end
            end),
         },
      },
      {
         key = "r",
         mods = "CMD",
         action = act.EmitEvent('tabs.manual-update-tab-title')
      },
      {
         key = '[',
         mods = 'CMD',
         action = wz.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
      },
      {
         key = ']',
         mods = 'CMD',
         action = wz.action.SplitVertical { domain = 'CurrentPaneDomain' },
      },
   },
}