conf_data = configuration_data()
conf_data.set('ThemeName', meson.project_name())
foreach theme: cursor_f
  configure_file(input : '@0@'.format(theme),
                 output : '@0@'.format(theme),
                 configuration : conf_data,
                 install_dir: theme_dir)
endforeach

conf_data = configuration_data()
conf_data.set('ThemeName', meson.project_name())
foreach theme: index_f        
  configure_file(input : '@0@'.format(theme),
                 output : '@0@'.format(theme),
                 configuration : conf_data,
                 install_dir: theme_dir)
endforeach

