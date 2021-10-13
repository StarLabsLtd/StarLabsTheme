plymouth_dir = join_paths(get_option('datadir'), 'plymouth', 'themes')
animation_stages = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15']


foreach icon_theme: icon_themes
  theme_dir = join_paths(plymouth_dir, icon_theme['name'])

  static_files = [
    'bullet.png',
    'entry.png',
    'box.png',
    'lock.png',
    'lock.svg',
    'StarLabs.grub',
  ]
  install_data(
    static_files,
    install_dir: theme_dir,
  )
  plymouth_conf = configuration_data()
  plymouth_conf.set('name', icon_theme['name'])

  plymouth_file = configure_file(
    input: 'StarLabs.plymouth.in',
    output: '@0@.plymouth'.format(icon_theme['name']),
    configuration: plymouth_conf,
  )
  install_data(
    plymouth_file,
    install_dir: theme_dir,
  )
  animation_svg = configure_file(
    input: 'plymouth.svg',
    output: icon_theme['name'] + '.svg',
    copy: true,
  )
  file_svg = configure_file(
    output: '@0@@1@'.format(icon_theme['name'], '.svg'),
    command: ['sed', '-i', icon_theme['hex'], '@OUTPUT@']
  )
  foreach stage: animation_stages
    target_temp_name = '@0@.@1@'.format(icon_theme['name'], stage)
    animation_png = configure_file(
      input: file_svg,
      output: target_temp_name + '.png',
      command: [
        inkscape,
        '--export-id=@0@'.format(stage),
#       '--export-dpi=@0@'.format(dpi),
        '--export-filename=@OUTPUT@',
        '@INPUT@',
      ]
    )
    install_data(
      animation_png,
      rename: 'animation-00' + stage + '.png',
      install_dir: theme_dir,
    )
  endforeach  
endforeach
