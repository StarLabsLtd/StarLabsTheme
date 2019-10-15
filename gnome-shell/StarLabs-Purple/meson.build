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
	'../Master/activities-active.svg',
	'../Master/activities.svg',
	'../Master/button-active.svg',
	'../Master/button-default-focus.svg',
	'../Master/button-default-hover.svg',
	'../Master/button-default.svg',
	'../Master/button-disabled.svg',
	'../Master/button-focus.svg',
	'../Master/button-hover.svg',
	'../Master/button.svg',
	'../Master/calendar-arrow-left.svg',
	'../Master/calendar-arrow-right.svg',
	'../Master/calendar-today.svg',
	'../Master/checkbox-active.svg',
	'../Master/checkbox-focused.svg',
	'../Master/checkbox-off-active.svg',
	'../Master/checkbox-off-focused.svg',
	'../Master/checkbox-off.svg',
	'../Master/checkbox.svg',
	'../Master/close-window-active.svg',
	'../Master/close-window-hover.svg',
	'../Master/close-window.svg',
	'../Master/corner-ripple-ltr.svg',
	'../Master/corner-ripple-rtl.svg',
	'../Master/dash-placeholder.svg',
	'../Master/key-enter.svg',
	'../Master/key-hide.svg',
	'../Master/key-layout.svg',
	'../Master/key-shift-latched-uppercase.svg',
	'../Master/key-shift.svg',
	'../Master/key-shift-uppercase.svg',
	'../Master/message-indicator-symbolic.svg',
	'../Master/noise-texture.svg',
	'../Master/page-indicator-active.svg',
	'../Master/page-indicator-checked.svg',
	'../Master/page-indicator-hover.svg',
	'../Master/page-indicator-inactive.svg',
	'../Master/process-working.svg',
	'../Master/toggle-off.svg',
	'../Master/toggle-on.svg'
]

# install static data files
install_data(data_sources, install_dir: install_dir)
