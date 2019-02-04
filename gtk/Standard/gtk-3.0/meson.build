gnome = import('gnome')
sassc = find_program('sassc')

gtk3_dir = join_paths(theme_dir, 'gtk-3.0')

# theme sources .scss files
gtk3_scss_sources = [
  'gtk-dark',
  'gtk',
]

# Dependencies of the files that need to be compiled
gtk3_scss_dependencies = [
  'sass/_starlabs.scss',
  'sass/_functions.scss',
  'sass/functions/_checkradio.scss',
  'sass/functions/_dialog_window.scss',
  'sass/functions/_font-size.scss',
  'sass/functions/_switch.scss',
  'sass/functions/_circle.scss',
  'sass/functions/_entries.scss',
  'sass/functions/_header.scss',
  'sass/functions/_undershoot.scss',
  'sass/functions/_clickable.scss',
  'sass/functions/_fill.scss',
  'sass/functions/_overshoot.scss',
  'sass/_common.scss',
  'sass/_drawing.scss',
  'sass/_colors.scss',
  'sass/_colors-public.scss',
  'sass/_apps.scss',
]

gtk3_assets = [
  'assets.svg',
]

# generate .css files
# and install to themes/THEMENAME/gtk-3.0
generated_css = []
foreach f : gtk3_scss_sources
  generated_css += custom_target('standard-gtk-3.0-' + f + '-generated.css',
      input: f + '.scss',
      output: f + '-generated.css',
      depend_files: files(gtk3_scss_dependencies),
      command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
  )
endforeach


# Bundle CSS and assets into gtk.gresource
asset_xml = []
foreach f : gtk3_assets
  asset_xml += '<file>@0@</file>'.format(f)
endforeach
conf_data = configuration_data()
conf_data.set('ASSETS', '\n'.join(asset_xml))
gresource_xml = configure_file(
  input: 'gtk.gresource.xml.in',
  output: 'gtk.gresource.xml',
  configuration: conf_data)

gnome.compile_resources('gtk', gresource_xml,
  gresource_bundle: true,
  dependencies: generated_css,
  install: true,
  install_dir: gtk3_dir,
)

# Install stub CSS files
install_data(['gtk.css', 'gtk-dark.css'], install_dir: gtk3_dir)
