sassc = find_program('sassc')

# destination directory
theme_dir = join_paths(get_option('prefix'), 'share', 'themes')
gnomeshell_theme_dir = join_paths(get_option('datadir'), 'gnome-shell', 'theme')
install_dir = join_paths(theme_dir, 'StarLabs-Yellow-Light', 'gnome-shell')

# generate .css files
theme_sources = [
	'gnome-shell.scss',
	'../Master/gnome-shell-sass/_colors.scss',
	'../Master/gnome-shell-sass/_common.scss',
	'../Master/gnome-shell-sass/_dock.scss',
	'../Master/gnome-shell-sass/_drawing.scss',
	'../Master/gnome-shell-sass/_starlabs.scss',
]

# generate .css files
# and install to themes/THEMENAME/gtk-3.0
custom_target('StarLabs-Yellow-Light-gnome',
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
	'../Master/checkbox-focused.svg',
	'../Master/checkbox-off-focused.svg',
	'../Master/checkbox-off.svg',
	'../Master/checkbox.svg',
	'../Master/dash-placeholder.svg',
	'../Master/logged-in-indicator.svg',
	'../Master/lockscreen-gradient.svg',
	'../Master/message-indicator-symbolic.svg',
	'../Master/no-events.svg',
	'../Master/noise-texture.png',
	'../Master/no-notifications.svg',
	'../Master/pad-osd.css',
	'../Master/process-working.svg',
	'../Master/running-indicator.svg',
	'../Master/source-button-border.svg',
	'../Master/summary-counter.svg',
	'../Master/toggle-off-hc.svg',
	'../Master/toggle-off.svg',
	'../Master/toggle-on-hc.svg',
	'../Master/toggle-on.svg',
	'../Master/ubuntu-logo-icon.svg',
	'../Master/ws-switch-arrow-down.svg',
	'../Master/ws-switch-arrow-up.svg',
	'../Master/ubuntu-appgrid-icon.svg',
	'../Master/key-enter.svg',
	'../Master/key-hide.svg',
	'../Master/key-layout.svg',
	'../Master/key-shift.svg',
	'../Master/key-shift-latched-uppercase.svg',
	'../Master/key-shift-uppercase.svg',
	'../Master/wallpaper.png',
]

# install static data files
install_data(data_sources, install_dir: install_dir)
