files_ext = files(
        run_command(
                'find', '-L', join_paths('gnome-shell-extension-lockkeys', 'lockkeys@vaina.lt'), '-name', '*'
                ).stdout().strip().split('\n')
        )
assert(files_ext.length() > 0, 'No extension sources found')


#ext_dir = join_paths(get_option('datadir'), 'gnome-shell', 'extensions')
#schema_dir = join_paths(get_option('datadir'), 'glib-2.0', 'schemas')


#install_subdir(
#  join_paths('gnome-shell-extension-lockkeys', 'lockkeys@vaina.lt'),
#  install_dir: ext_dir,
#)

#schema_sources = [
#	'gnome-shell-extension-lockkeys/lockkeys@vaina.lt/schemas/org.gnome.shell.extensions.lockkeys.gschema.xml',
#]

#install_data(
#  schema_sources,
#  install_dir: schema_dir
#)
