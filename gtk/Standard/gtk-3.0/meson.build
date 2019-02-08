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
  'sass/functions/_entries.scss',
  'sass/functions/_header.scss',
  'sass/functions/_undershoot.scss',
  'sass/functions/_clickable.scss',
  'sass/functions/_fill.scss',
  'sass/functions/_overshoot.scss',
  'sass/_sections.scss',
  'sass/sections/_base.scss',
  'sass/sections/_spinnerautomation.scss',
  'sass/sections/_textentries.scss',
  'sass/sections/_buttons.scss',
  'sass/sections/_links.scss',
  'sass/sections/_gtkspinbutton.scss',
  'sass/sections/_comboboxes.scss',
  'sass/sections/_toolbar.scss',
  'sass/sections/_headerbar.scss',
  'sass/sections/_pathbar.scss',
  'sass/sections/_treeview.scss',
  'sass/sections/_menu.scss',
  'sass/sections/_popover.scss',
  'sass/sections/_notebook.scss',
  'sass/sections/_scrollbars.scss',
  'sass/sections/_switch.scss',
  'sass/sections/_radiocheck.scss',
  'sass/sections/_gtkscale.scss',
  'sass/sections/_progressbar.scss',
  'sass/sections/_levelbar.scss',
  'sass/sections/_printdialog.scss',
  'sass/sections/_frames.scss',
  'sass/sections/_lists.scss',
  'sass/sections/_appnotifications.scss',
  'sass/sections/_expander.scss',
  'sass/sections/_calendar.scss',
  'sass/sections/_dialog.scss',
  'sass/sections/_sidebar.scss',
  'sass/sections/_filechooser.scss',
  'sass/sections/_paned.scss',
  'sass/sections/_infobar.scss',
  'sass/sections/_tooltip.scss',
  'sass/sections/_colorchooser.scss',
  'sass/sections/_misc.scss',
  'sass/sections/_windowdecorations.scss',
  'sass/sections/_touchcopypaste.scss',
  'sass/sections/_emoji.scss',
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
