ext_dir = join_paths(get_option('datadir'), 'gnome-shell', 'extensions', 'lockkeys@vaina.lt')
install_dir = ext_dir

ext_sources = [
'lockkeys@vaina.lt/extension.js',
'lockkeys@vaina.lt/LICENSE',
'lockkeys@vaina.lt/lockkeys.pot',
'lockkeys@vaina.lt/metadata.json',
'lockkeys@vaina.lt/prefs.js',
'lockkeys@vaina.lt/stylesheet.css',
'lockkeys@vaina.lt/utils.js',
]

install_data(ext_sources, install_dir: install_dir)


icon_dir = join_paths(ext_dir, 'icons')
install_dir = icon_dir

icon_sources = [
'lockkeys@vaina.lt/icons/capslock-disabled-symbolic.svg',
'lockkeys@vaina.lt/icons/capslock-enabled-symbolic.svg',
'lockkeys@vaina.lt/icons/numlock-disabled-symbolic.svg',
'lockkeys@vaina.lt/icons/numlock-enabled-symbolic.svg',
]

install_data(icon_sources, install_dir: install_dir)

schema_dir = join_paths(ext_dir, 'schemas')
install_dir = schema_dir

schema_sources = [
'lockkeys@vaina.lt/schemas/gschemas.compiled',
'lockkeys@vaina.lt/schemas/org.gnome.shell.extensions.lockkeys.gschema.xml',
]

install_data(schema_sources, install_dir: install_dir)


glib_dir = join_paths(get_option('datadir'), 'glib-2.0', 'schemas')


glib_sources = [
	'org.gnome.shell.extensions.lockkeys.gschema.xml',
]

install_data(glib_sources, install_dir: schema_dir)
