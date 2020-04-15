# destination directory
theme_dir = join_paths(get_option('prefix'), 'share', 'themes')
gnomeshell_theme_dir = join_paths(get_option('datadir'), 'gnome-shell', 'theme')
install_dir = join_paths(theme_dir, 'StarLabs-Yellow-Light', 'gnome-shell')

theme_css = []
theme_sources = files(
	run_command(
		'find', '-L', '../Master', '-name', '*.scss'
		).stdout().strip().split('\n')
	)
assert(theme_sources.length() > 0, 'No theme sources found')

# generate .css files
theme_sources = [
	'gnome-shell.scss',
	'../Master/gnome-shell-sass/_colors.scss',
	'../Master/gnome-shell-sass/_common.scss',
	'../Master/gnome-shell-sass/_dock.scss',
	'../Master/gnome-shell-sass/_drawing.scss',
	'../Master/gnome-shell-sass/_starlabs.scss',
	'../Master/gnome-shell-sass/_widgets.scss',
	'../Master/gnome-shell-sass/widgets/_a11y.scss',
	'../Master/gnome-shell-sass/widgets/_app-grid.scss',
	'../Master/gnome-shell-sass/widgets/_base.scss',
	'../Master/gnome-shell-sass/widgets/_buttons.scss',
	'../Master/gnome-shell-sass/widgets/_calendar.scss',
	'../Master/gnome-shell-sass/widgets/_check-box.scss',
	'../Master/gnome-shell-sass/widgets/_corner-ripple.scss',
	'../Master/gnome-shell-sass/widgets/_dash.scss',
	'../Master/gnome-shell-sass/widgets/_dialogs.scss',
	'../Master/gnome-shell-sass/widgets/_entries.scss',
	'../Master/gnome-shell-sass/widgets/_hotplug.scss',
	'../Master/gnome-shell-sass/widgets/_ibus-popup.scss',
	'../Master/gnome-shell-sass/widgets/_keyboard.scss',
	'../Master/gnome-shell-sass/widgets/_login-dialog.scss',
	'../Master/gnome-shell-sass/widgets/_looking-glass.scss',
	'../Master/gnome-shell-sass/widgets/_message-list.scss',
	'../Master/gnome-shell-sass/widgets/_misc.scss',
	'../Master/gnome-shell-sass/widgets/_network-dialog.scss',
	'../Master/gnome-shell-sass/widgets/_notifications.scss',
	'../Master/gnome-shell-sass/widgets/_osd.scss',
	'../Master/gnome-shell-sass/widgets/_overview.scss',
	'../Master/gnome-shell-sass/widgets/_panel.scss',
	'../Master/gnome-shell-sass/widgets/_popovers.scss',
	'../Master/gnome-shell-sass/widgets/_screen-shield.scss',
	'../Master/gnome-shell-sass/widgets/_scrollbars.scss',
	'../Master/gnome-shell-sass/widgets/_search-entry.scss',
	'../Master/gnome-shell-sass/widgets/_search-results.scss',
	'../Master/gnome-shell-sass/widgets/_slider.scss',
	'../Master/gnome-shell-sass/widgets/_switcher-popup.scss',
	'../Master/gnome-shell-sass/widgets/_switches.scss',
	'../Master/gnome-shell-sass/widgets/_tiled-previews.scss',
	'../Master/gnome-shell-sass/widgets/_window-picker.scss',
	'../Master/gnome-shell-sass/widgets/_workspace-switcher.scss',
	'../Master/gnome-shell-sass/widgets/_workspace-thumbnails.scss',
	'../Master/gnome-shell-sass/_oliverqueen.scss',
]
theme_css=[]
style_css=[]
# generate .css files
# and install to themes/THEMENAME/gtk-3.0
style_css += custom_target('StarLabs-Yellow-Light-gnome',
	input: 'gnome-shell.scss',
	output: 'gnome-shell.css',
	depend_files: files(theme_sources),
	command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
	build_by_default: true,
	install: true,
	install_dir: install_dir,
)

theme_css += style_css
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

gresource_xml = files('gnome-shell-theme.gresource.xml')[0]

data_svg = run_command(
	gresources_xml_parser, [
		join_paths(meson.source_root(), '@0@'.format(gresource_xml)),
		'--filter', '*.css',
	],
).stdout().strip().split('\n')

assert(data_sources.length() > 0 and data_sources[0] != '', 'No data sources found')

gnome.compile_resources(
    'gnome-shell-theme',
    gresource_xml,
    dependencies: theme_css,
    gresource_bundle: true,
    install: true,
    install_dir: install_dir,
)
