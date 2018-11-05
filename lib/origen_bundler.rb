require "origen_bundler/version"

module OrigenBundler
  class << self

    def configure_for_origen
      return unless origen_application?
      puts "Plugin is working!"
      exit 0
    end

    def origen_application?
      app_config = File.join('config', 'application.rb')
      app_version = File.join('config', 'version.rb')

      if File.exist?(app_config) && File.exist?(app_version)
        @origen_root = Dir.pwd
      else
        path = Pathname.new(Dir.pwd)
        until path.root? || @origen_root
          if File.exist?(File.join(path, app_config)) && File.exist?(File.join(path, app_version))
            @origen_root = Dir.pwd
          else
            path = path.parent
          end
        end
      end
      !!@origen_root
    end
  end
end
