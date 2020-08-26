### File Dependancies
files_gtk_scss = files(
        run_command(
                'find', '-L', '../_sass', '-name', '*.scss'
                ).stdout().strip().split('\n')
        )
assert(files_gtk_scss.length() > 0, 'No theme sources found')
### Program Dependancies

gtk_versions = [
  '3.0',
]

foreach theme: themes
  gtk_variants = [
    '',
  ]

  # Only non-dark themes need a dark variant.
  if theme['color'] != '-Dark'
    gtk_variants += '-dark'
  endif

  gtk_scss_conf = configuration_data()
  gtk_scss_conf.set('variant', theme['scss_variant'])
  gtk_scss_conf.set('topbar', theme['scss_topbar'])
  gtk_scss_conf.set('accent', theme['scss_accent'])
  gtk_scss_conf.set('hex', theme['scss_hex'])

  foreach gtk_version: gtk_versions
    gtk_version_dir = join_paths(theme['dir'], 'gtk-@0@'.format(gtk_version))

    install_subdir(
      'assets',
      install_dir: gtk_version_dir,
    )

    #
    # SCSS
    #

    foreach gtk_variant: gtk_variants
      gtk_temp_name = 'gtk@0@.gtk-@1@.@2@'.format(gtk_variant, gtk_version, theme['name'])

      # Configure SCSS file
      gtk_scss = configure_file(
        input: 'gtk@0@.scss.in'.format(gtk_variant),
        output: '@0@.scss'.format(gtk_temp_name),
        configuration: gtk_scss_conf,
      )
      # Compile CSS file
      gtk_css = configure_file(
        input: gtk_scss,
        output: '@0@.css'.format(gtk_temp_name),
        command: [sassc, sassc_opts, '@INPUT@', '@OUTPUT@'],
      )
      # Install CSS file
      install_data(
        gtk_css,
        rename: 'gtk@0@.css'.format(gtk_variant),
        install_dir: gtk_version_dir,
      )

    endforeach
  endforeach
endforeach
