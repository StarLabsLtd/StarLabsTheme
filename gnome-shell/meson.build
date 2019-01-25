# destination directory
install_dir = join_paths(get_option('datadir'), 'gnome-shell', 'theme')

# generate .css files
theme_sources = files([
  'gnome-shell.scss',
  'sass/_starlabs.scss',
  'sass/_functions.scss',
  'sass/functions/_entries.scss',
  'sass/functions/_clickable.scss',
  'sass/functions/_fill.scss',
  'sass/functions/_font-size.scss',
  'sass/_sections.scss',
  'sass/sections/_access_dialog.scss',
  'sass/sections/_audio_selection_dialog.scss',
  'sass/sections/_auth_dialog.scss',
  'sass/sections/_background_menu.scss',
  'sass/sections/_base.scss',
  'sass/sections/_calendar.scss',
  'sass/sections/_candidate_popup.scss',
  'sass/sections/_check.scss',
  'sass/sections/_dashboard.scss',
  'sass/sections/_dock.scss',
  'sass/sections/_end_session_dialog.scss',
  'sass/sections/_entries.scss',
  'sass/sections/_extension_dialog.scss',
  'sass/sections/_geolocation_dialog.scss',
  'sass/sections/_keyboard.scss',
  'sass/sections/_links.scss',
  'sass/sections/_login_dialog.scss',
  'sass/sections/_looking_glass_dialog.scss',
  'sass/sections/_magnifier.scss',
  'sass/sections/_messages.scss',
  'sass/sections/_modal_dialog.scss',
  'sass/sections/_network_dialog.scss',
  'sass/sections/_notifications.scss',
  'sass/sections/_osd.scss',
  'sass/sections/_overview.scss',
  'sass/sections/_polkit_dialog.scss',
  'sass/sections/_popup_menu.scss',
  'sass/sections/_prompt_dialog.scss',
  'sass/sections/_screen_shield.scss',
  'sass/sections/_scrollbars.css',
  'sass/sections/_shell_mount_dialog.scss',
  'sass/sections/_slider.scss',
  'sass/sections/_switcher_popup.scss',
  'sass/sections/_switches.scss',
  'sass/sections/_tile_preview.scss',
  'sass/sections/_top_bar.scss',
  'sass/sections/_widgets.scss',
  'sass/sections/_window_cycler.scss',
  'sass/sections/_workspace_switcher.scss',
])

styles = [
  'gnome-shell'
]

theme_deps = []

sassc = find_program('sassc')
foreach style: styles
  theme_deps += custom_target('style-' + style,
                              input: '@0@.scss'.format(style),
                              output: '@0@.css'.format(style),
                              command: [
                                sassc, '-a', '@INPUT@', '@OUTPUT@'
                              ],
                              install: true,
                              install_dir: install_dir,
                              depend_files: theme_sources)
endforeach

# static files to copy
data_sources = [
  'assets/calendar-arrow-left.svg',
  'assets/calendar-arrow-right.svg',
  'assets/calendar-today.svg',
  'assets/checkbox-focused.svg',
  'assets/checkbox-off-focused.svg',
  'assets/checkbox-off.svg',
  'assets/checkbox.svg',
  'assets/close.svg',
  'assets/close-window-active.svg',
  'assets/close-window-hover.svg',
  'assets/close-window.svg',
  'assets/corner-ripple-ltr.svg',
  'assets/corner-ripple-rtl.svg',
  'assets/dash-placeholder.svg',
  'assets/dots.svg',
  'assets/filter-selected-ltr.svg',
  'assets/filter-selected-rtl.svg',
  'assets/logged-in-indicator.svg',
  'assets/lockscreen-gradient.svg',
  'assets/message-indicator-symbolic.svg',
  'assets/no-events.svg',
  'assets/no-notifications.svg',
  'assets/page-indicator-active.svg',
  'assets/page-indicator-checked.svg',
  'assets/page-indicator-hover.svg',
  'assets/page-indicator-inactive.svg',
  'assets/process-working.svg',
  'assets/running-indicator.svg',
  'assets/source-button-border.svg',
  'assets/summary-counter.svg',
  'assets/toggle-off-hc.svg',
  'assets/toggle-off.svg',
  'assets/toggle-on-hc.svg',
  'assets/toggle-on.svg',
  'assets/ubuntu-logo-icon.svg',
  'assets/ws-switch-arrow-down.svg',
  'assets/ws-switch-arrow-up.svg',
  'assets/activities.svg',
  'assets/wallpaper.png',
  'assets/ubuntu-appgrid-icon.svg',
  'assets/key-enter.svg',
  'assets/key-hide.svg',
  'assets/key-layout.svg',
  'assets/key-shift.svg',
  'assets/key-shift-latched-uppercase.svg',
  'assets/key-shift-uppercase.svg'
]

# install static data files
install_data(data_sources, install_dir: install_dir)
