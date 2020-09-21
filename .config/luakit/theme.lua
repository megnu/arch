--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "13px IBMPlexMono"
theme.fg   = "#fff"
theme.bg   = "#0F2422"

-- Genaral colours
theme.success_fg = "#D2E6E2"
theme.loaded_fg  = "#D2E6E2"
theme.error_fg = "#430C12"
theme.error_bg = "#D2E6E2"

-- Warning colours
theme.warning_fg = "#000"
theme.warning_bg = "#FCE0E9"

-- Notification colours
theme.notif_fg = "#000"
theme.notif_bg = "#73D2BC"

-- Menu colours
theme.menu_fg                   = "#fff"
theme.menu_bg                   = "#0F2422"
theme.menu_selected_fg          = "#fff"
theme.menu_selected_bg          = "#2D8C76"
theme.menu_title_bg             = "#0F2422"
theme.menu_primary_title_fg     = "#fff"
theme.menu_secondary_title_fg   = "#D2CF73"

theme.menu_disabled_fg = "#999"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#73D2BC"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#D2E6E2'
theme.proxy_inactive_menu_fg    = '#000'
theme.proxy_inactive_menu_bg    = '#FCE0E9'

-- Statusbar specific
theme.sbar_fg         = "#fff"
theme.sbar_bg         = "#0F2422"

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = "#0F2422"
theme.dbar_error_fg   = "#73D283"

-- Input bar specific
theme.ibar_fg           = "#000"
theme.ibar_bg           = "#D2E6E2"

-- Tab label
theme.tab_fg            = "#fff"
theme.tab_bg            = "#0F2422"
theme.tab_hover_bg      = "#8C2D7C"
theme.tab_ntheme        = "#D2E6E2"
theme.selected_fg       = "#fff"
theme.selected_bg       = "#2D8C76"
theme.selected_ntheme   = "#D2E6E2"
theme.loading_fg        = "#73D2BC"
theme.loading_bg        = "#000"

theme.selected_private_tab_bg = "#568C2D"
theme.private_tab_bg    = "#430C12"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#73D283"
theme.notrust_fg        = "#430C12"

-- Follow mode hints
theme.hint_font = "13px IBMPlexMono"
theme.hint_fg = "#fff"
theme.hint_bg = "#430C12"
theme.hint_border = "1px dashed #D27389"
theme.hint_overlay_bg = "#998C2D7C"
theme.hint_overlay_border = "1px dotted #73D283"
theme.hint_overlay_selected_bg = "#73D283"
theme.hint_overlay_selected_border = theme.hint_overlay_border

-- General colour pairings
theme.ok = { fg = "#000", bg = "#D2E6E2" }
theme.warn = { fg = "#430C12", bg = "#D2E6E2" }
theme.error = { fg = "#430C12", bg = "#FCE0E9" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
