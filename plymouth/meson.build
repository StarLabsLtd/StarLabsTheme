plymouth_dir = join_paths(get_option('datadir'), 'plymouth', 'themes')
install_dir = join_paths(plymouth_dir, meson.project_name())

plymouth_sources = [
	'StarLabs.plymouth',
	'StarLabs-Firmware.plymouth',
	'animation-0001.png',
	'animation-0002.png',
	'animation-0003.png',
	'animation-0004.png',
	'animation-0005.png',
	'animation-0006.png',
	'animation-0007.png',
	'animation-0008.png',
	'animation-0009.png',
	'animation-0010.png',
	'animation-0011.png',
	'animation-0012.png',
	'animation-0013.png',
	'animation-0014.png',
	'animation-0015.png',
	'animation-0016.png',
	'animation-0017.png',
	'animation-0018.png',
]
install_data(plymouth_sources, install_dir: install_dir)

meson.add_install_script('meson/plymouth')





