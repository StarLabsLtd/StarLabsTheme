ext_dir = join_paths(get_option('datadir'), 'gnome-shell', 'extensions')

install_subdir('gnome-shell-extension-lockkeys/lockkeys@vaina.lt',
	install_dir: ext_dir,
	strip_directory: false,
)

schema_dir = join_paths(get_option('datadir'), 'glib-2.0', 'schemas')

schema_sources = [
	'gnome-shell-extension-lockkeys/lockkeys@vaina.lt/schemas/org.gnome.shell.extensions.lockkeys.gschema.xml',
]

install_data(schema_sources, install_dir: schema_dir)
