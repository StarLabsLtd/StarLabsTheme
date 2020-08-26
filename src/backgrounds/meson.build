backgrounds_dir = join_paths(get_option('datadir'), 'backgrounds')
install_dir = join_paths(backgrounds_dir, meson.project_name())
backgrounds_sources = [
  'Wallpaper1.svg',
  'Wallpaper2.jpg',
  'Wallpaper3.jpg',
  'Wallpaper4.jpg',
]
install_data(
  backgrounds_sources,
  install_dir: install_dir
)

xml_dir = join_paths(get_option('datadir'), 'gnome-background-properties')
xml_sources = [
  'StarLabs.xml',
]
install_data(
  xml_sources,
  install_dir: xml_dir
)
