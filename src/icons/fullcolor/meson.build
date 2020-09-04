# Get list of object from current SVG
objects = run_command(
  inkscape, '-S', 'master.svg',
).stdout().strip().split('\n')

links = run_command(
  'cat', 'links.txt',
).stdout().strip().split('\n')


foreach icon_theme: icon_themes

  foreach object: objects
  # Remove co-ordinates
    object = object.split(',').get(0)

    if object.contains('_')

      target = object.split('_').get(0)
      name = object.split('_').get(1)

      target_temp_name = '@0@.@1@.@2@'.format(icon_theme['name'], target, name)

      master_svg = configure_file(
        input: 'master.svg',
        output: icon_theme['name'] + '.svg',
        copy: true,
      )

      file_svg = configure_file(
        output: '@0@@1@'.format(icon_theme['name'], '.svg'),
        command: ['sed', '-i', icon_theme['hex'], '@OUTPUT@']
      )

      file_48 = configure_file(
        input: file_svg,
        output: target_temp_name + size + '.png',
        command: [
          inkscape, '--batch-process',
          '--actions="select:@0@;AlignHorizontalCenter;AlignVerticalCenter;"'.format(object),
          '--export-id=@0@'.format(object),
          '--export-id-only',
          '--export-area-page',
          '--export-dpi=96',
          '--export-filename=@OUTPUT@',
          '@INPUT@',
        ]
      )
      install_data(
        file_48,
        rename: name + '.svg',
        install_dir: join_paths(icon_theme['dir'], '48', target),
      )
    endif
  endforeach

  foreach link: links
    target = link.split('_').get(0)
    source = link.split('_').get(1)
    destination = link.split('_').get(2)

    sym = configure_file(
      output: destination,
      command: ['ln', '-frs', source, destination],
    )

    install_data(
      sym,
      install_dir: join_paths(icon_theme['dir'], '48', target),
    )

  endforeach
  
endforeach
