theme_dir = join_paths(get_option('prefix'), 'share/icons', meson.project_name())
theme_dir_light = join_paths(get_option('prefix'), 'share/icons', meson.project_name()+'-Light')
theme_dir_dark = join_paths(get_option('prefix'), 'share/icons', meson.project_name()+'-Dark')
theme_dir_circle = join_paths(get_option('prefix'), 'share/icons', meson.project_name()+'-Circle')
theme_dir_squircle = join_paths(get_option('prefix'), 'share/icons', meson.project_name()+'-Squircle')


install_subdir('StarLabs',
  install_dir: theme_dir,
  strip_directory: true,
  exclude_files: ['index.theme', 'cursor.theme', 'meson.build'],
)

install_subdir('StarLabs-Light',
  install_dir: theme_dir_light,
  strip_directory: true,
  exclude_files: ['index.theme', 'cursor.theme', 'meson.build'],
)

install_subdir('StarLabs-Dark',
  install_dir: theme_dir_dark,
  strip_directory: true,
  exclude_files: ['index.theme', 'cursor.theme', 'meson.build'],
)

install_subdir('StarLabs-Circle',
  install_dir: theme_dir_circle,
  strip_directory: true,
  exclude_files: ['index.theme', 'cursor.theme', 'meson.build'],
)

install_subdir('StarLabs-Squircle',
  install_dir: theme_dir_squircle,
  strip_directory: true,
  exclude_files: ['index.theme', 'cursor.theme', 'meson.build'],
)

cursor_f = [
  'cursor.theme',
]

index_f = [
  'index.theme',
]

subdir('StarLabs')
subdir('StarLabs-Light')
subdir('StarLabs-Dark')
subdir('StarLabs-Circle')
subdir('StarLabs-Squircle')

meson.add_install_script('meson/post_install.py', meson.project_name())
