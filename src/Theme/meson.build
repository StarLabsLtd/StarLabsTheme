project(
  'theme',
  version: '999',
  license: 'GPLv2+',
  meson_version: '>= 0.47.0',
  default_options: ['prefix=/usr'],
)

theme_base_name = get_option('theme_name')
theme_base_dir = join_paths(get_option('datadir'), 'themes', theme_base_name)

sassc = find_program('sassc')
sassc_opts = ['-M', '-t', 'expanded']

themes = []
foreach color: get_option('colors')
  foreach accent: get_option('accents')
    if color == 'default'
      color_suffix = ''
      scss_variant = 'light'
      scss_topbar = 'light'
    elif color == 'dark'
      color_suffix = '-Dark'
      scss_variant = 'dark'
      scss_topbar = 'dark'
    endif

    if accent == 'default'
      accent_suffix = ''
      scss_accent = 'blue'
      scss_hex = '#0068bf'
    elif accent == 'green'
      accent_suffix = '-Green'
      scss_accent = 'green'
      scss_hex = '#43a047'
    endif

    themes += {
      'name': theme_base_name + color_suffix + accent_suffix,
      'dir': theme_base_dir + color_suffix + accent_suffix,
      'color': color_suffix,
      'accent': accent_suffix,
      'scss_variant': scss_variant,
      'scss_topbar': scss_topbar,
      'scss_accent': scss_accent,
      'scss_hex': scss_hex,
    }
  endforeach
endforeach

foreach theme: themes
  install_data(
    install_dir: theme['dir'],
  )
endforeach

subdir('src')
