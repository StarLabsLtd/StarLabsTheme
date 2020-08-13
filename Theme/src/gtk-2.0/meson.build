foreach theme: themes
  gtk2_dir = join_paths(theme['dir'], 'gtk-2.0')

  gtk_2_conf = configuration_data()
  gtk_2_conf.set('hex', theme['scss_hex'])


  if theme['color'] != '-Dark'
    gtk2_assets_dir = 'assets'
    install_data(
      'menubar-toolbar.rc',
       install_dir: gtk2_dir,
    )
  else
    gtk2_assets_dir = 'assets-dark'
    install_data(
      'menubar-toolbar-dark.rc',
       rename: 'menubar-tooolbar.rc',
       install_dir: gtk2_dir,
    )
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
 
  # Copy it from build dir to source dir
  run_command(
    'cp',
     gtkrc,
     meson.current_source_dir(),
    )

  install_data(
    'gtkrc' + theme['color'] + theme['scss_hex'],
    rename: 'gtkrc',
    install_dir: gtk2_dir,
  )

  install_data(
    [
      'apps.rc',
      'main.rc',
      'panel.rc',
      'xfce-notify.rc',
    ],
    install_dir: gtk2_dir,
  )
endforeach
