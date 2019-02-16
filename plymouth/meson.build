plymouth_dir = join_paths(get_option('datadir'), 'plymouth', 'themes')
install_dir = join_paths(plymouth_dir, meson.project_name())

plymouth_sources = [
	'StarLabs.plymouth',
	'StarLabs.script',
	'StarLabs.grub',
	'wallpaper.png',
	'password-field.png',
	'progress-dot-off.png',
	'progress-dot-on.png',
	'ubuntu-logo16.png',
	'ubuntu-logo.png',
]

install_data(plymouth_sources, install_dir: install_dir)

meson.add_install_script('meson/plymouth')


