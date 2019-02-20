ext_dir = join_paths(get_option('datadir'), 'gnome-shell', 'extensions', 'indicator@starlabs.systems')
install_dir = ext_dir

ext_sources = [
	'indicator@starlabs.systems/extension.js',
	'indicator@starlabs.systems/lockkeys.pot',
	'indicator@starlabs.systems/metadata.json',
	'indicator@starlabs.systems/prefs.js',
	'indicator@starlabs.systems/stylesheet.css',
	'indicator@starlabs.systems/utils.js',
]

install_data(ext_sources, install_dir: install_dir)


icon_dir = join_paths(ext_dir, 'icons')
install_dir = icon_dir

icon_sources = [
	'indicator@starlabs.systems/icons/capslock-disabled-symbolic.svg',
	'indicator@starlabs.systems/icons/capslock-enabled-symbolic.svg',
	'indicator@starlabs.systems/icons/numlock-disabled-symbolic.svg',
	'indicator@starlabs.systems/icons/numlock-enabled-symbolic.svg',
]

install_data(icon_sources, install_dir: install_dir)

schema_dir = join_paths(ext_dir, 'schemas')
install_dir = schema_dir

schema_sources = [
	'indicator@starlabs.systems/schemas/gschemas.compiled',
	'indicator@starlabs.systems/schemas/org.gnome.shell.extensions.indicator.gschema.xml',
]

install_data(schema_sources, install_dir: install_dir)


glib_dir = join_paths(get_option('datadir'), 'glib-2.0' , 'schemas')


glib_sources = [
	'org.gnome.shell.extensions.indicator.gschema.xml',
]

install_data(glib_sources, install_dir: glib_dir)
