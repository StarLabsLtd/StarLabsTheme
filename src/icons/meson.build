inkscape = find_program('inkscape')
foreach icon_theme: icon_themes

  index_icon_conf = configuration_data()
  index_icon_conf.set('icon_name', icon_theme['name'])

  index_theme = configure_file(
    input: 'index.theme.in',
    output: 'index.@0@.theme'.format(icon_theme['name']),
    configuration: index_icon_conf,
  )
  install_data(
    index_theme,
    rename: 'index.theme',
    install_dir: icon_theme['dir'],
  )
  cursor_theme = configure_file(
    input: 'cursor.theme.in',
    output: 'cursor.@0@.theme'.format(icon_theme['name']),
    configuration: index_icon_conf,
  )
  install_data(
    cursor_theme,
    rename: 'cursor.theme',
    install_dir: icon_theme['dir'],
  )
  install_subdir(
    'scalable-max-32',
    install_dir: icon_theme['dir'],
  )


endforeach

subdir('fullcolor')
subdir('cursors')
subdir('scalable')
