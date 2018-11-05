require 'origen_bundler'

Bundler::Plugin.add_hook('before-install-all') do |dependencies|
  puts "Plugin is working!"
  exit 0
end
