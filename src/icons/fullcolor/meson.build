sizes = [16, 24, 32, 48, 64, 256]
# Get list of object from current SVG
objects = run_command(
  inkscape, '-S', 'master.svg',
).stdout().strip().split('\n')

links = run_command(
  'cat', 'links.txt',
).stdout().strip().split('\n')


foreach icon_theme: icon_themes
  master_svg = configure_file(
    input: 'master.svg',
    output: icon_theme['name'] + '.svg',
    copy: true,
  )

  file_svg = configure_file(
    output: '@0@@1@'.format(icon_theme['name'], '.svg'),
    command: ['sed', '-i', icon_theme['hex'], '@OUTPUT@']
   )
   foreach object: objects


  # Remove co-ordinates
    object = object.split(',').get(0)

    if object.contains('_')

      target = object.split('_').get(0)
      name = object.split('_').get(1)

      foreach dpi: sizes
        target_temp_name = '@0@.@1@.@2@.@3@'.format(icon_theme['name'], target, name, dpi)

        png = configure_file(
          input: file_svg,
          output: target_temp_name + '.png',
          command: [
            inkscape, '--batch-process',
            '--export-id=@0@'.format(object),
            '--export-dpi=@0@'.format(dpi),
            '--export-filename=@OUTPUT@',
            '@INPUT@',
          ]
        )
        install_data(
          png,
          rename: name + '.png',
          install_dir: join_paths(icon_theme['dir'], dpi, target),
        )
      endforeach
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
    foreach dpi: sizes
      install_data(
        sym,
        install_dir: join_paths(icon_theme['dir'], dpi, target),
      )
    endforeach

  endforeach
  
endforeach
