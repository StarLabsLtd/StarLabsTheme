plymouth_dir = join_paths(get_option('datadir'), 'plymouth', 'themes')
install_dir = join_paths(plymouth_dir, meson.project_name())

plymouth_sources = [
 'StarLabs.plymouth',
 'StarLabs.script',
 'wallpaper.png',
   'loading/loading-01.png',
   'loading/loading-02.png',
   'loading/loading-03.png',
   'loading/loading-04.png',
   'loading/loading-05.png',
   'loading/loading-06.png',
   'loading/loading-07.png',
   'loading/loading-08.png',
   'loading/loading-09.png',
   'loading/loading-10.png',
   'loading/loading-11.png',
   'loading/loading-12.png',
   'loading/loading-13.png',
   'loading/loading-14.png',
   'loading/loading-15.png',
   'loading/loading-16.png',
   'loading/loading-17.png',
   'loading/loading-18.png',
   'loading/loading-19.png',
   'loading/loading-20.png',
   'loading/loading-21.png',
   'loading/loading-22.png',
   'loading/loading-23.png',
   'loading/loading-24.png',
]

install_data(plymouth_sources, install_dir: install_dir)

meson.add_install_script('meson/plymouth')


