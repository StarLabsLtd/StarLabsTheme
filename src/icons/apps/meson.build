folder = 'apps'

files_full_color_svg = run_command(
  'find',
  meson.current_source_dir(),
  '-type', 'f',
  '-name', '*.svg',
  '-printf', '%f\n'
).stdout().strip().split('\n')
assert(files_full_color_svg.length() > 0, 'No theme sources found')

links_full_color_svg = run_command(
  'cat', files('list.txt'),
).stdout().strip().split('\n')

inkscape = find_program('inkscape')

foreach icon: icons
  foreach svg: files_full_color_svg
    svg_temp_name = '@0@.@1@'.format(icon['name'], svg)

    svg_shaped = configure_file(
      input: svg,
      output: svg_temp_name,
      command: [inkscape, '--batch-process', icon['options'], '--export-area-page', '--export-filename=@OUTPUT@', '@INPUT@'],
    )

    svg_colored = configure_file(
      input: svg_shaped,
      output: svg_temp_name,
      command: ['sed', '-i', icon['hex'], '@OUTPUT@']
    )

    install_data(
      svg_colored,
      rename: svg,
      install_dir: join_paths(icon['dir'], folder),
    )
  endforeach

  foreach link: links_full_color_svg
    source = link.split(' ').get(0)
    destination = link.split(' ').get(1)

    symlink = configure_file(
      output: destination,
      command: ['ln', '-fs', source, destination],
    )
    install_data(
      symlink,
      install_dir: join_paths(icon['dir'], folder),
    )
  endforeach

endforeach
  
