require "origen_bundler/version"

module OrigenBundler
  class << self

    def configure_for_origen
      puts "Plugin is working!"
      exit 0
    end

    def origen_application?
      true
    end
  end
end
