gnome_shell = find_program('gnome-shell', required: false)

if get_option('gnome_shell_version') != ''
  gnome_shell_version = get_option('gnome_shell_version')
else
  if gnome_shell.found()
    gnome_shell_version_array = run_command([gnome_shell, '--version']).stdout().split('\n')[0].split(' ')[-1].strip().split('.')

    if gnome_shell_version_array[1].to_int().is_even()
      gnome_shell_version = '.'.join([gnome_shell_version_array[0], gnome_shell_version_array[1]])
    else
      gnome_shell_version = '.'.join([gnome_shell_version_array[0], (gnome_shell_version_array[1].to_int() + 1).to_string()])
    endif
  else
    message('gnome-shell not found, using styles for last gnome-shell version availible')
    gnome_shell_version = '3.36'
  endif
endif

gnome_shell_scss_depend_files = files([
  '../_sass/_variables.scss',
  '../_sass/_colors.scss',
])

foreach theme: themes
  gnome_shell_dir = join_paths(theme['dir'], 'gnome-shell')

  if theme['color'] != '-dark'
    gnome_shell_assets_dir = 'assets'
  else
    gnome_shell_assets_dir = 'assets-dark'
  endif

  gnome_shell_assets_common_dir = 'assets-common'

  install_subdir(
    gnome_shell_assets_dir,
    strip_directory: true,
    install_dir: join_paths(gnome_shell_dir, 'assets'),
  )
  
  install_subdir(
    gnome_shell_assets_common_dir,
    strip_directory: true,
    install_dir: join_paths(gnome_shell_dir, 'assets'),
  )

  install_data(
    [
      'gnome-shell-theme.gresource.xml',
      'noise-texture.png',
      'pad-osd.css',
    ],
    install_dir: gnome_shell_dir,
  )

  #
  # SCSS
  #

  gnome_shell_scss_conf = configuration_data()
  gnome_shell_scss_conf.set('variant', theme['scss_variant'])
  gnome_shell_scss_conf.set('topbar', theme['scss_topbar'])
  gnome_shell_scss_conf.set('accent', theme['scss_accent'])
  gnome_shell_scss_conf.set('version', gnome_shell_version)
  gnome_shell_scss_conf.set('hex', theme['scss_hex'])

  # Configure SCSS file
  gnome_shell_scss = configure_file(
    input: 'gnome-shell.scss.in',
    output: 'gnome-shell.@0@.scss'.format(theme['name']),
    configuration: gnome_shell_scss_conf,
  )

  # Copy it from build dir to source dir
  run_command(
    'cp',
    gnome_shell_scss,
    meson.current_source_dir(),
  )

  # Generate CSS file
  gnome_shell_css = custom_target(
    'gnome-shell.@0@.css'.format(theme['name']),
    input: 'gnome-shell.@0@.scss'.format(theme['name']),
    output: 'gnome-shell.@0@.css'.format(theme['name']),
    command: [sassc, sassc_opts, '@INPUT@', '@OUTPUT@'],
    depend_files: gnome_shell_scss_depend_files,
    build_by_default: true,
  )

  # Install it while renaming to a valid name
  meson.add_install_script(
    'sh', '-c', 'cp "@0@" "@1@"'.format(
      gnome_shell_css.full_path(),
      join_paths('$MESON_INSTALL_DESTDIR_PREFIX', gnome_shell_dir, 'gnome-shell.css'),
    ),
  )
endforeach
