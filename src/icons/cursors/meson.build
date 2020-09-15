xcursorgen = find_program('xcursorgen')
dpis = [90, 135, 180]
sequence = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24']
# Get list of object from current SVG
### File Dependancies
objects = run_command(
    'find', '-L', 'config/', '-name', '*.cursor'
).stdout().strip().split('\n')



links = run_command(
  'cat', 'links.txt',
).stdout().strip().split('\n')


foreach icon_theme: icon_themes
  cursor_svg = configure_file(
    input: 'cursors.svg',
    output: icon_theme['name'] + '.svg',
    copy: true,
  )

  cursor_svg = configure_file(
    output: '@0@@1@'.format(icon_theme['name'], '.svg'),
    command: ['sed', '-i', icon_theme['hex'], '@OUTPUT@']
  )
  foreach object: objects
    object = object.split('/').get(1)
    name = object.split('.').get(0)

    foreach dpi: dpis
      if name == 'wait' or name == 'progress'
        foreach stage: sequence
          target_temp_name = '@0@.@1@-@2@'.format(dpi, name, stage)
          cursor_png = configure_file(
            input: cursor_svg,
            output: target_temp_name + '.png',
            command: [
              inkscape, '--batch-process',
              '--export-id=@0@-@1@'.format(name, stage),
              '--export-dpi=@0@'.format(dpi),
              '--export-filename=@OUTPUT@',
              '@INPUT@',
            ]
          )
        endforeach
      else
        target_temp_name = '@0@.@1@'.format(dpi, name)
        cursor_png = configure_file(
          input: cursor_svg,
          output: target_temp_name + '.png',
          command: [
            inkscape, '--batch-process',
            '--export-id=@0@'.format(name),
            '--export-dpi=@0@'.format(dpi),
            '--export-filename=@OUTPUT@',
            '@INPUT@',
          ]
        )
      endif
    endforeach

    cursor_temp_name = '@0@.@1@'.format(icon_theme['name'], name)

    cursor = configure_file(
      input: cursor_png,
      output: cursor_temp_name,
      command: [
        xcursorgen,
        '-p', meson.current_build_dir(),
        meson.current_source_dir() + '/config/' + object, cursor_temp_name,
      ]
    )
    install_data(
      cursor,
      rename: name,
      install_dir: join_paths(icon_theme['dir'], 'cursors'),
    )
  endforeach

  foreach link: links
    source = link.split('+').get(1)
    destination = link.split('+').get(0)

    sym = configure_file(
      output: destination,
      command: ['ln', '-frs', source, destination],
    )

    install_data(
      sym,
      install_dir: join_paths(icon_theme['dir'], 'cursors'),
    )

  endforeach
  
endforeach
