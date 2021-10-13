# Get list of object from current SVG
## File Dependancies
scalable_objects = run_command(
  inkscape, '-S', 'master.svg',
).stdout().strip().split('\n')

foreach object: scalable_objects
  object = object.split(',').get(0)

  if object.contains('_')
    target = object.split('_').get(0)
    name = object.split('_').get(1)

    target_temp_name = '@0@.@1@'.format(target, name)

    svg = configure_file(
      input: 'master.svg',
      output: target_temp_name + '-symbolic.svg',
      command: [
        inkscape,
        '--export-id=@0@'.format(object),
        '--export-filename=@OUTPUT@',
        '--export-id-only',
        '--export-plain-svg',
        '@INPUT@',
      ]
    )
    foreach icon_theme: icon_themes
      install_data(
        svg,
        rename: name + '-symbolic.svg',
        install_dir: join_paths(icon_theme['dir'], 'scalable', target),
      )
    endforeach
  endif
endforeach
