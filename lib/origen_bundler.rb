require "origen_bundler/version"

module OrigenBundler
  Bundler::Plugin.add_hook('before-install-all') do |dependencies|
    puts "Plugins is working!"
    exit 0
  end
end
