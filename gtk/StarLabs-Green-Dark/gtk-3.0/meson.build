sassc = find_program('sassc')

gtk3_dir = join_paths(get_option('prefix'), 'share', 'themes', 'StarLabs-Green-Dark', 'gtk-3.0')
gtk3_asset_dir = join_paths(gtk3_dir, 'assets')

# Dependencies of the files that need to be compiled
gtk3_scss_dependencies = [
	'../../Master/gtk-3.0/_apps.scss',
	'../../Master/gtk-3.0/_colors-public.scss',
	'../../Master/gtk-3.0/_colors.scss',
	'../../Master/gtk-3.0/_common.scss',
	'../../Master/gtk-3.0/_drawing.scss',
	'../../Master/gtk-3.0/_starlabs.scss',
	'../../Master/gtk-3.0/_barryallen.scss',
]

custom_target('StarLabs-Green-Dark-gtk',
    input: '../../StarLabs-Green/gtk-3.0/gtk-dark.scss',
    output: 'gtk.css',
    depend_files: files(gtk3_scss_dependencies),
    command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
    build_by_default: true,
    install: true,
    install_dir: gtk3_dir,
)
# assets are just a symlink to the light themes as they are not modified
# meson.add_install_script('sh', '-c', 'ln -sf ../../'+meson.project_name()+'/gtk-3.0/assets $MESON_INSTALL_DESTDIR_PREFIX/'+gtk3_asset_dir)
