module Lolipop::Mc::Starter::Rails
  module Config
    NOCHECK = '-'.freeze
    SKIPCHECK = 'skip'.freeze
    
    def self.load
      config_path = "#{Dir.pwd}/.mc-rails.yml"
      unless File.exist?(config_path)
        f = File.open(config_path, 'w')
        YAML.dump({'git' => NOCHECK, 'ruby' => NOCHECK, 'rails' => NOCHECK, 'ssh' => NOCHECK, 'nodejs' => NOCHECK}, f)
        f.close
      end
      YAML.load_file(config_path)
    end

    def self.dump(obj)
      config_path = "#{Dir.pwd}/.mc-rails.yml"
      f = File.open(config_path, 'w')
      YAML.dump(obj, f)
      f.close
    end
  end
end

