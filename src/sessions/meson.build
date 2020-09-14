# NOTE: GNOME Shell only accept lowercase mode names.
foreach icon_theme: icon_themes

  session_conf = configuration_data()
  session_conf.set('name', icon_theme['name'])
  session_conf.set('lowercase_name', icon_theme['name'].to_lower())
  session_conf.set('hex', icon_theme['color'])

  json = configure_file(
    input : 'mode.json.in',
    output : icon_theme['name'].to_lower()+'.json',
    configuration : session_conf,
    install_dir: join_paths(get_option('datadir'), 'gnome-shell', 'modes')
  )

  desktop = configure_file(
    input : 'THEMENAME.desktop.in',
    output : icon_theme['name'] + '.desktop',
    configuration : session_conf,
    install_dir: join_paths(get_option('datadir'), 'xsessions')
  )

  wayland = configure_file(
    input : 'THEMENAME-wayland.desktop.in',
    output : icon_theme['name'] + '-wayland.desktop',
    configuration : session_conf,
    install_dir: join_paths(get_option('datadir'), 'wayland-sessions')
  )

  schema = configure_file(
    input : 'THEMENAME.gschema.override.in',
    output : '99_' + icon_theme['name'] + '.gschema.override',
    configuration : session_conf,
    install_dir: join_paths(get_option('datadir'), 'glib-2.0', 'schemas')
  )
endforeach
