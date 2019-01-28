gnomeshell_theme_dir = join_paths(get_option('datadir'), 'gnome-shell', 'theme')

# destination directory
install_dir = join_paths(gnomeshell_theme_dir, meson.project_name())

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
  'gnome-shell-theme.gresource.xml',
  'calendar-arrow-left.svg',
  'calendar-arrow-right.svg',
  'calendar-today.svg',
  'checkbox-focused.svg',
  'checkbox-off-focused.svg',
  'checkbox-off.svg',
  'checkbox.svg',
  'close.svg',
  'close-window-active.svg',
  'close-window-hover.svg',
  'close-window.svg',
  'corner-ripple-ltr.svg',
  'corner-ripple-rtl.svg',
  'dash-placeholder.svg',
  'dots.svg',
  'filter-selected-ltr.svg',
  'filter-selected-rtl.svg',
  'logged-in-indicator.svg',
  'lockscreen-gradient.svg',
  'message-indicator-symbolic.svg',
  'no-events.svg',
  'no-notifications.svg',
  'page-indicator-active.svg',
  'page-indicator-checked.svg',
  'page-indicator-hover.svg',
  'page-indicator-inactive.svg',
  'process-working.svg',
  'running-indicator.svg',
  'source-button-border.svg',
  'summary-counter.svg',
  'toggle-off-hc.svg',
  'toggle-off.svg',
  'toggle-on-hc.svg',
  'toggle-on.svg',
  'ubuntu-logo-icon.svg',
  'ws-switch-arrow-down.svg',
  'ws-switch-arrow-up.svg',
  'activities.svg',
  'wallpaper.png',
  'ubuntu-appgrid-icon.svg',
  'key-enter.svg',
  'key-hide.svg',
  'key-layout.svg',
  'key-shift.svg',
  'key-shift-latched-uppercase.svg',
  'key-shift-uppercase.svg',
]

# install static data files
install_data(data_sources, install_dir: install_dir)
