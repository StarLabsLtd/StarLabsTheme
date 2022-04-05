# NOTE: GNOME Shell only accept lowercase mode names.

styles = ['Standard', 'Dark']
foreach style: styles

  if style == 'Dark'
    substyle = '-Dark'
  else
    substyle = ''
  endif

  foreach icon_theme: icon_themes

    session_conf = configuration_data()
    session_conf.set('name', icon_theme['name'])
    session_conf.set('name_w_dark', icon_theme['name'] + substyle)
    session_conf.set('lowercase_name', icon_theme['name'].to_lower())
    session_conf.set('lowercase_name_w_dark', icon_theme['name'].to_lower() + substyle.to_lower())
    session_conf.set('hex', icon_theme['color'])

    json = configure_file(
      input : 'mode.json.in',
      output : icon_theme['name'].to_lower() + substyle.to_lower() + '.json',
      configuration : session_conf,
      install_dir: join_paths(get_option('datadir'), 'gnome-shell', 'modes')
    )

    desktop = configure_file(
      input : 'THEMENAME.desktop.in',
      output : icon_theme['name'] + substyle + '.desktop',
      configuration : session_conf,
      install_dir: join_paths(get_option('datadir'), 'xsessions')
    )

    wayland = configure_file(
      input : 'THEMENAME-wayland.desktop.in',
      output : icon_theme['name'] + substyle + '-wayland.desktop',
      configuration : session_conf,
      install_dir: join_paths(get_option('datadir'), 'wayland-sessions')
    )

    schema = configure_file(
      input : 'THEMENAME.gschema.override.in',
      output : '99_' + icon_theme['name'] + substyle + '.gschema.override',
      configuration : session_conf,
      install_dir: join_paths(get_option('datadir'), 'glib-2.0', 'schemas')
    )
  endforeach
endforeach
