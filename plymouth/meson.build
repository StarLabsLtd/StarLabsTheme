plymouth_dir = join_paths(get_option('datadir'), 'plymouth', 'themes')
install_dir = join_paths(plymouth_dir, meson.project_name())

plymouth_sources = [
	'animation.png',
	'box.png',
	'bullet.png',
	'entry.png',
	'lock.png',
	'StarLabs.plymouth',
	'StarLabs.script',
	'StarLabs-text.plymouth',
	'wallpaper.png',
]
install_data(plymouth_sources, install_dir: install_dir)

meson.add_install_script('meson/plymouth')
