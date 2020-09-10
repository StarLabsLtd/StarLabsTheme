foreach theme: themes
  gtk2_dir = join_paths(theme['dir'], 'gtk-2.0')

  gtk_2_conf = configuration_data()
  gtk_2_conf.set('hex', theme['scss_hex'])


  if theme['color'] != '-Dark'
    gtk2_assets_dir = 'assets'
  else
    gtk2_assets_dir = 'assets-dark'
  endif

  install_subdir(
    gtk2_assets_dir,
    strip_directory: true,
    install_dir: join_paths(gtk2_dir, 'assets'),
  )

  # Configure GTKRC
  gtkrc = configure_file(
    input: 'gtkrc' + theme['color'] + '.in',
    output: 'gtkrc' + theme['color'] + theme['scss_hex'],
    configuration: gtk_2_conf,
  )
  install_data(
    gtkrc,
    rename: 'gtkrc',
    install_dir: gtk2_dir,
  )

  install_data(
    [
      'apps.rc',
      'hacks.rc',
      'main.rc',
      'main.rc.hidpi',
    ],
    install_dir: gtk2_dir,
  )
endforeach
