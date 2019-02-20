install_dir = join_paths('/boot', 'grub')

wallpaper_sources = [
	'wallpaper.png',
]

install_data(wallpaper_sources, install_dir: install_dir)

install_dir = join_paths('/etc', 'grub.d')

override_sources = [
	'47_starlabs',
]

install_data(override_sources, install_dir: install_dir)

# meson.add_install_script('sh', '-c', 'update-grub')
