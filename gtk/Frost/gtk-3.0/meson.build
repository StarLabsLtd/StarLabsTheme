sassc = find_program('sassc')

gtk3_dir = join_paths(theme_dir, 'gtk-3.0')
gtk3_asset_dir = join_paths(gtk3_dir, 'assets')

# Dependencies of the files that need to be compiled
gtk3_scss_dependencies = [
  '../../Standard/gtk-3.0/sass/_starlabs.scss',
  '../../Standard/gtk-3.0/sass/_functions.scss',
  '../../Standard/gtk-3.0/sass/_colors.scss',
  '../../Standard/gtk-3.0/sass/_drawing.scss',
  '../../Standard/gtk-3.0/sass/_sections.scss',
  '../../Standard/gtk-3.0/sass/_apps.scss',
  '../../Standard/gtk-3.0/sass/_colors-public.scss',
]

# generate .css files
# and install to themes/THEMENAME-Frost/gtk-3.0
custom_target('gtk3_frost',
    input: '../../Standard/gtk-3.0/gtk-frost.scss',
    output: 'gtk.css',
    depend_files: files(gtk3_scss_dependencies),
    command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
    build_by_default: true,
    install: true,
    install_dir: gtk3_dir,
)

# assets are just a symlink to the light themes as they are not modified
meson.add_install_script('sh', '-c', 'ln -sf ../../'+meson.project_name()+'/gtk-3.0/assets $MESON_INSTALL_DESTDIR_PREFIX/'+gtk3_asset_dir)
