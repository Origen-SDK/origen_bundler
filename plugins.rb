require 'origen_bundler'

Bundler::Plugin.add_hook('before-install-all') do |dependencies|
  OrigenBundler.configure_for_origen if OrigenBundler.origen_application?
end
