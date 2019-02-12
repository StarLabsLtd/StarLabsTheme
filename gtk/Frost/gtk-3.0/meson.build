sassc = find_program('sassc')

gtk3_dir = join_paths(theme_dir, 'gtk-3.0')
gtk3_asset_dir = join_paths(gtk3_dir, 'assets')

# Dependencies of the files that need to be compiled
gtk3_scss_dependencies = [
  '../../Standard/gtk-3.0/sass/_starlabs.scss',
  '../../Standard/gtk-3.0/sass/_functions.scss',
  '../../Standard/gtk-3.0/sass/functions/_checkradio.scss',
  '../../Standard/gtk-3.0/sass/functions/_dialog_window.scss',
  '../../Standard/gtk-3.0/sass/functions/_font-size.scss',
  '../../Standard/gtk-3.0/sass/functions/_switch.scss',
  '../../Standard/gtk-3.0/sass/functions/_entries.scss',
  '../../Standard/gtk-3.0/sass/functions/_header.scss',
  '../../Standard/gtk-3.0/sass/functions/_undershoot.scss',
  '../../Standard/gtk-3.0/sass/functions/_clickable.scss',
  '../../Standard/gtk-3.0/sass/functions/_fill.scss',
  '../../Standard/gtk-3.0/sass/functions/_overshoot.scss',
  '../../Standard/gtk-3.0/sass/functions/_button.scss',
  '../../Standard/gtk-3.0/sass/_sections.scss',
  '../../Standard/gtk-3.0/sass/sections/_apps.scss',
  '../../Standard/gtk-3.0/sass/sections/_buttons.scss',
  '../../Standard/gtk-3.0/sass/sections/_calendar.scss',
  '../../Standard/gtk-3.0/sass/sections/_colorchooser.scss',
  '../../Standard/gtk-3.0/sass/sections/_comboboxes.scss',
  '../../Standard/gtk-3.0/sass/sections/_dialog.scss',
  '../../Standard/gtk-3.0/sass/sections/_entries.scss',
  '../../Standard/gtk-3.0/sass/sections/_headerbar.scss',
  '../../Standard/gtk-3.0/sass/sections/_links.scss',
  '../../Standard/gtk-3.0/sass/sections/_lists.scss',
  '../../Standard/gtk-3.0/sass/sections/_menu.scss',
  '../../Standard/gtk-3.0/sass/sections/_misc.scss',
  '../../Standard/gtk-3.0/sass/sections/_popover.scss',
  '../../Standard/gtk-3.0/sass/sections/_radiocheck.scss',
  '../../Standard/gtk-3.0/sass/sections/_rounding.scss',
  '../../Standard/gtk-3.0/sass/sections/_scrollbars.scss',
  '../../Standard/gtk-3.0/sass/sections/_selection.scss',
  '../../Standard/gtk-3.0/sass/sections/_sidebar.scss',
  '../../Standard/gtk-3.0/sass/sections/_slider.scss',
  '../../Standard/gtk-3.0/sass/sections/_switch.scss',
  '../../Standard/gtk-3.0/sass/sections/_text.scss',
  '../../Standard/gtk-3.0/sass/sections/_toolbar.scss',
  '../../Standard/gtk-3.0/sass/sections/_treeview.scss',
  '../../Standard/gtk-3.0/sass/sections/_decorations.scss',
  '../../Standard/gtk-3.0/sass/sections/_window.scss',
  '../../Standard/gtk-3.0/sass/sections/_notifications.scss',
  '../../Standard/gtk-3.0/sass/sections/_tooltip.scss',
  '../../Standard/gtk-3.0/sass/sections/_spinner.scss',
  '../../Standard/gtk-3.0/sass/sections/_notebook.scss',
  '../../Standard/gtk-3.0/sass/sections/_searchbar.scss',
]

# generate .css files
# and install to themes/THEMENAME-Frost/gtk-3.0
custom_target('gtk3_frost',
    input: '../../Standard/gtk-3.0/gtk-frost.scss',
    output: 'gtk.css',
    depend_files: files(gtk3_scss_dependencies),
    command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
    build_by_default: true,
    install: true,
    install_dir: gtk3_dir,
)

# assets are just a symlink to the light themes as they are not modified
meson.add_install_script('sh', '-c', 'ln -sf ../../'+meson.project_name()+'/gtk-3.0/assets $MESON_INSTALL_DESTDIR_PREFIX/'+gtk3_asset_dir)
