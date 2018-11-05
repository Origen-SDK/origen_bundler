require "origen_bundler/version"
require "origen/site_config"
require "pathname"

module OrigenBundler
  class << self
    def configure_for_origen(dependencies)
      return unless origen_application?
      $_origen_invocation_pwd ||= Pathname.pwd
      return unless Origen.site_config.gem_manage_bundler
      # If gems have been installed to the app, always use them
      vendor_gems = File.join(origen_root, 'vendor', 'gems')
      if File.exist?(vendor_gems)
        ENV['BUNDLE_PATH'] = vendor_gems
      else
        ENV['BUNDLE_PATH'] = File.expand_path(Origen.site_config.gem_install_dir)
      end
      ENV['BUNDLE_BIN'] = File.join(origen_root, 'lbin')
    end

    def origen_root
      @origen_root
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
