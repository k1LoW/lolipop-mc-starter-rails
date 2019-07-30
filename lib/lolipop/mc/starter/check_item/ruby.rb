module Lolipop
  module Mc
    module Starter
      module CheckItem
        class Ruby < Base
          def check
            stdout = `ruby -v`
            raise 'Ruby 2.6.3がみつかりません' unless stdout.match(/2\.6\.3/)
            config = load_config
            config['ruby'] = stdout.strip
            dump_config(config)
            "Rubyがインストールされています [#{stdout.strip}]"
          end
        end
      end
    end
  end
end
