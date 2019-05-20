plymouth_dir = join_paths(get_option('datadir'), 'plymouth', 'themes')
main_dir = join_paths(plymouth_dir, meson.project_name())

main_sources = [
	'password-field16.png',
	'password-field.png',
	'progress-dot-off16.png',
	'progress-dot-off.png',
	'progress-dot-on16.png',
	'progress-dot-on.png',
	'StarLabs.grub',
	'StarLabs.plymouth',
	'StarLabs.script',
	'ubuntu-logo16.png',
	'ubuntu-logo.png',
	'wallpaper.png',
]

install_data(main_sources, install_dir: main_dir)

meson.add_install_script('meson/plymouth')

