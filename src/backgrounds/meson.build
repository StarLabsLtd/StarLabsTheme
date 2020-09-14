foreach icon_theme: icon_themes

  background_conf = configuration_data()
  background_conf.set('name', icon_theme['name'])
  background_conf.set('hex', icon_theme['color'])

  source_wallpaper = configure_file(
    input: 'master.svg',
    output: icon_theme['name'] + '.svg',
    copy: true,
  )

  wallpaper = configure_file(
    input: source_wallpaper,
    output: icon_theme['name'] + '.svg',
    command: ['sed', '-i', icon_theme['hex'], '@OUTPUT@'],
    install_dir: join_paths(get_option('datadir'), 'backgrounds', icon_theme['name']),
  )

  xml = configure_file(
    input: 'index.xml.in',
    output: icon_theme['name'] + '.xml',
    configuration: background_conf,
    install_dir: join_paths(get_option('datadir'), 'gnome-background-properties'),
  )
endforeach
