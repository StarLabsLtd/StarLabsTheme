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
  '../../Standard/gtk-3.0/sass/_sections.scss',
  '../../Standard/gtk-3.0/sass/sections/_base.scss',
  '../../Standard/gtk-3.0/sass/sections/_spinnerautomation.scss',
  '../../Standard/gtk-3.0/sass/sections/_textentries.scss',
  '../../Standard/gtk-3.0/sass/sections/_buttons.scss',
  '../../Standard/gtk-3.0/sass/sections/_links.scss',
  '../../Standard/gtk-3.0/sass/sections/_gtkspinbutton.scss',
  '../../Standard/gtk-3.0/sass/sections/_comboboxes.scss',
  '../../Standard/gtk-3.0/sass/sections/_toolbar.scss',
  '../../Standard/gtk-3.0/sass/sections/_headerbar.scss',
  '../../Standard/gtk-3.0/sass/sections/_pathbar.scss',
  '../../Standard/gtk-3.0/sass/sections/_treeview.scss',
  '../../Standard/gtk-3.0/sass/sections/_menu.scss',
  '../../Standard/gtk-3.0/sass/sections/_popover.scss',
  '../../Standard/gtk-3.0/sass/sections/_notebook.scss',
  '../../Standard/gtk-3.0/sass/sections/_scrollbars.scss',
  '../../Standard/gtk-3.0/sass/sections/_switch.scss',
  '../../Standard/gtk-3.0/sass/sections/_radiocheck.scss',
  '../../Standard/gtk-3.0/sass/sections/_gtkscale.scss',
  '../../Standard/gtk-3.0/sass/sections/_progressbar.scss',
  '../../Standard/gtk-3.0/sass/sections/_levelbar.scss',
  '../../Standard/gtk-3.0/sass/sections/_printdialog.scss',
  '../../Standard/gtk-3.0/sass/sections/_frames.scss',
  '../../Standard/gtk-3.0/sass/sections/_lists.scss',
  '../../Standard/gtk-3.0/sass/sections/_appnotifications.scss',
  '../../Standard/gtk-3.0/sass/sections/_expander.scss',
  '../../Standard/gtk-3.0/sass/sections/_calendar.scss',
  '../../Standard/gtk-3.0/sass/sections/_dialog.scss',
  '../../Standard/gtk-3.0/sass/sections/_sidebar.scss',
  '../../Standard/gtk-3.0/sass/sections/_filechooser.scss',
  '../../Standard/gtk-3.0/sass/sections/_paned.scss',
  '../../Standard/gtk-3.0/sass/sections/_infobar.scss',
  '../../Standard/gtk-3.0/sass/sections/_tooltip.scss',
  '../../Standard/gtk-3.0/sass/sections/_colorchooser.scss',
  '../../Standard/gtk-3.0/sass/sections/_misc.scss',
  '../../Standard/gtk-3.0/sass/sections/_windowdecorations.scss',
  '../../Standard/gtk-3.0/sass/sections/_touchcopypaste.scss',
  '../../Standard/gtk-3.0/sass/sections/_emoji.scss',
  '../../Standard/gtk-3.0/sass/_drawing.scss',
  '../../Standard/gtk-3.0/sass/_colors.scss',
  '../../Standard/gtk-3.0/sass/_colors-public.scss',
  '../../Standard/gtk-3.0/sass/_apps.scss',
]

# generate .css files
# and install to themes/THEMENAME-Frost/gtk-3.0
custom_target('gtk3_light',
    input: '../../Standard/gtk-3.0/gtk-light.scss',
    output: 'gtk.css',
    depend_files: files(gtk3_scss_dependencies),
    command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
    build_by_default: true,
    install: true,
    install_dir: gtk3_dir,
)

# assets are just a symlink to the light themes as they are not modified
meson.add_install_script('sh', '-c', 'ln -sf ../../'+meson.project_name()+'/gtk-3.0/assets $MESON_INSTALL_DESTDIR_PREFIX/'+gtk3_asset_dir)
