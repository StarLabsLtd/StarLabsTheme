project(
  'StarLabs',
  version: '4.0.0',
  license: ['GPL3', 'CC BY-SA 4.0'],
  meson_version: '>= 0.52.0',
  default_options: ['prefix=/usr'],
)

sass_opts = ['--no-source-map']
inkscape = find_program('inkscape')

theme_base_name = get_option('theme_name')
theme_base_dir = join_paths(get_option('datadir'), 'themes', theme_base_name)
icon_base_dir = join_paths(get_option('datadir'), 'icons', theme_base_name)

sassc = find_program('sassc')
sassc_opts = ['-M', '-t', 'expanded']

themes = []
icon_themes = []

foreach accent: get_option('accents')
  if accent == 'default'
    accent_suffix = ''
    scss_accent = 'blue'
    scss_hex = '#0068bf'
  elif accent == 'green'
    accent_suffix = '-Green'
    scss_accent = 'green'
    scss_hex = '#43a047'
  elif accent == 'orange'
    accent_suffix = '-Orange'
    scss_accent = 'orange'
    scss_hex = '#FB8B00'
  elif accent == 'pink'
    accent_suffix = '-Pink'
    scss_accent = 'pink'
    scss_hex = '#a345a0'
# If you want to add a new color variant, add it here.
#
# For example:
# elif accent == 'red'
#    accent_suffix = '-Orange'
#    scss_accent = 'red'
#    scss_hex = '#FF0000'
  endif

  foreach color: get_option('colors')
    if color == 'default'
      color_suffix = ''
      scss_variant = 'light'
      scss_topbar = 'light'
    elif color == 'dark'
      color_suffix = '-Dark'
      scss_variant = 'dark'
      scss_topbar = 'dark'
    endif
    themes += {
      'name': theme_base_name + accent_suffix + color_suffix,
      'dir': theme_base_dir + accent_suffix + color_suffix,
      'color': color_suffix,
      'accent': accent_suffix,
      'scss_variant': scss_variant,
      'scss_topbar': scss_topbar,
      'scss_accent': scss_accent,
      'scss_hex': scss_hex,
    }
  endforeach

  icon_themes += {
   'name': theme_base_name + accent_suffix,
   'dir': icon_base_dir + accent_suffix,
   'accent': accent_suffix,
   'hex': 's/#0068bf/' + scss_hex + '/',
   'color': scss_hex,
  }

endforeach

foreach theme: themes
  install_data(
    install_dir: theme['dir'],
  )
endforeach

subdir('src')
