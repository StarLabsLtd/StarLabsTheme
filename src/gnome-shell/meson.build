### File Dependancies
files_gnome_shell_scss = files(
        run_command(
                'find', '-L', '../_sass', '-name', '*.scss'
                ).stdout().strip().split('\n')
        )
assert(files_gnome_shell_scss.length() > 0, 'No theme sources found')

### Program Dependancies
gnome_shell = find_program('gnome-shell', required: false)
glib_compile_resources = find_program('glib-compile-resources')
gnome = import('gnome')



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




foreach theme: themes
  gnome_shell_dir = join_paths(theme['dir'], 'gnome-shell')
  gresource_dir = join_paths('share', 'gnome-shell', 'theme', theme['name'])

  install_data(
    [
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
  gnome_shell_scss_conf.set('theme_name', theme['name'])
  gnome_shell_scss_conf.set('color', theme['color'])

  # Configure SCSS file
  gnome_shell_scss = configure_file(
    input: 'gnome-shell.scss.in',
    output: 'gnome-shell.@0@.scss'.format(theme['name']),
    configuration: gnome_shell_scss_conf,
  )
  # Compile CSS file
  gnome_shell_css = configure_file(
    input: gnome_shell_scss,
    output: '@0@.css'.format(theme['name']),
    command: [sassc, sassc_opts, '@INPUT@', '@OUTPUT@'],
  )
  # Install CSS file
  install_data(
    gnome_shell_css,
    rename: 'gnome-shell.css',
    install_dir: gnome_shell_dir,
  )

  # Configure XML file
  gresource_xml = configure_file(
    input: 'gnome-shell-theme.gresource.xml.in',
    output: 'gnome-shell-theme.gresource.@0@.xml'.format(theme['name']),
    configuration: gnome_shell_scss_conf,
  )
  # Complile Gresource file
  gresource = configure_file(
    input: gresource_xml,
    output: 'gnome-shell-theme.gresource.@0@'.format(theme['name']),
    command: [glib_compile_resources, '@INPUT@', '--target', '@OUTPUT@'],
  )
  # Install Gresource file
  install_data(
    gresource,
    rename: 'gnome-shell-theme.gresource',
    install_dir: gresource_dir,
  )
endforeach
