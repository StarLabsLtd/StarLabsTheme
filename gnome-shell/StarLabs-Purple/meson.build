sassc = find_program('sassc')

# destination directory
theme_dir = join_paths(get_option('prefix'), 'share', 'themes',)
gnomeshell_theme_dir = join_paths(get_option('datadir'), 'gnome-shell', 'theme')
install_dir = join_paths(theme_dir, 'StarLabs-Purple', 'gnome-shell')

# generate .css files
theme_sources = [
	'gnome-shell.scss',
	'../Master/gnome-shell-sass/_colors.scss',
	'../Master/gnome-shell-sass/_common.scss',
	'../Master/gnome-shell-sass/_dock.scss',
	'../Master/gnome-shell-sass/_drawing.scss',
	'../Master/gnome-shell-sass/_starlabs.scss',
	'../Master/gnome-shell-sass/_oliverqueen.scss',
]

# generate .css files
# and install to themes/THEMENAME/gtk-3.0
custom_target('StarLabs-Purple-gnome',
    input: 'gnome-shell.scss',
    output: 'gnome-shell.css',
    depend_files: files(theme_sources),
    command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
    build_by_default: true,
    install: true,
    install_dir: install_dir,
)

# static files to copy
data_sources = [
'../Master/calendar-today.svg',
'../Master/checkbox-dark.svg',
'../Master/checkbox-focused-dark.svg',
'../Master/checkbox-focused.svg',
'../Master/checkbox-off-dark.svg',
'../Master/checkbox-off-focused-dark.svg',
'../Master/checkbox-off-focused.svg',
'../Master/checkbox-off.svg',
'../Master/checkbox.svg',
'../Master/dash-placeholder.svg',
'../Master/key-enter.svg',
'../Master/key-hide.svg',
'../Master/key-layout.svg',
'../Master/key-shift-latched-uppercase.svg',
'../Master/key-shift.svg',
'../Master/key-shift-uppercase.svg',
'../Master/lockscreen-gradient.svg',
'../Master/logged-in-indicator.svg',
'../Master/message-indicator-symbolic.svg',
'../Master/no-events.svg',
'../Master/noise-texture.svg',
'../Master/no-notifications.svg',
'../Master/pointer-double-click-symbolic.svg',
'../Master/pointer-drag-symbolic.svg',
'../Master/pointer-primary-click-symbolic.svg',
'../Master/pointer-secondary-click-symbolic.svg',
'../Master/process-working.svg',
'../Master/running-indicator.svg',
'../Master/source-button-border.svg',
'../Master/summary-counter.svg',
'../Master/toggle-off-dark.svg',
'../Master/toggle-off-hc.svg',
'../Master/toggle-off-intl.svg',
'../Master/toggle-off.svg',
'../Master/toggle-on-dark.svg',
'../Master/toggle-on-hc.svg',
'../Master/toggle-on-intl.svg',
'../Master/toggle-on.svg',
'../Master/ws-switch-arrow-down.svg',
'../Master/ws-switch-arrow-up.svg',
'../Master/yaru-indicator.svg',
]

# install static data files
install_data(data_sources, install_dir: install_dir)
