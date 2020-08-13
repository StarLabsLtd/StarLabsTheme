foreach theme: themes
	gtk_variants = [
		'',
	]

	if theme['variant'] != '-Dark'
		gtk_variants += '-dark'
	endif

	gtk_scss = configuration_data()
	gtk_scss.set('variant', theme['scss_variant'])
	gtk_scss.set('theme', theme['scss_theme'])

	gtk_version_dir = join_paths(theme['dir'], 'gtk-3.0')

	install_subdir(
		'assets',
		install_dir: gtk_version_dir,
	)

	foreach gtk_variant: gtk_variants
		gtk_temp_name = 'gtk@0@.gtk-@1@.@2@'.format(gtk_variant, '3.0', theme['name'])

		# Configure SCSS file
		gtk_scss = configure_file(
			input: 'gtk@0@.scss.in'.format(gtk_variant),
			output: '@0@.scss'.format(gtk_temp_name),
			configuration: gtk_scss,
		)

		# Copy it from build dir to source dir
		run_command(
			'cp',
			gtk_scss,
			meson.current_source_dir(),
		)

		# Generate CSS file
		gtk_css = custom_target(
			'@0@.css'.format(gtk_temp_name),
			input: '@0@.scss'.format(gtk_temp_name),
			output: '@0@.css'.format(gtk_temp_name),
			command: [sassc, sassc_opts, '@INPUT@', '@OUTPUT@'],
		#	depend_files: gtk_scss_depend_files,
			build_by_default: true,
		)

		# Install it while renaming to a valid name
		meson.add_install_script(
			'sh', '-c', 'cp "@0@" "@1@"'.format(
				gtk_css.full_path(),
				join_paths('$MESON_INSTALL_DESTDIR_PREFIX', gtk_version_dir, 'gtk@0@.css'.format(gtk_variant)),
			),
		)
	endforeach
endforeach

