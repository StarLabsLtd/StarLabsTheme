### File Dependencies
files_scss = files(
        run_command(
                'find', '-L', '_sass', '-name', '*.scss'
                ).stdout().strip().split('\n')
        )
assert(files_scss.length() > 0, 'No theme sources found')


foreach theme: themes
  index_theme_conf = configuration_data()
  index_theme_conf.set('theme_name', theme['name'])

  index_theme = configure_file(
    input: 'index.theme.in',
    output: 'index.@0@.theme'.format(theme['name']),
    configuration: index_theme_conf,
  )

  install_data(
    index_theme,
    rename: 'index.theme',
    install_dir: theme['dir'],
  )
endforeach

subdir('backgrounds')
#subdir('cinnamon')
subdir('extensions')
#subdir('firefox')
subdir('font')
subdir('gnome-shell')
subdir('grub')
subdir('gtk-2.0')
subdir('gtk-3.0')
#subdir('icons')
#subdir('metacity-1')
#subdir('plank')
subdir('plymouth')
subdir('sessions')
subdir('sounds')
#subdir('unity')
#subdir('xfwm4')
