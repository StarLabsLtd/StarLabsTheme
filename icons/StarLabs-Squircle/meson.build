conf_data = configuration_data()
conf_data.set('ThemeName', meson.project_name()+'-Squircle')
foreach theme: index_f
  configure_file(input : '@0@'.format(theme),
                 output : '@0@'.format(theme),
                 configuration : conf_data,
                 install_dir: theme_dir_squircle)
endforeach


