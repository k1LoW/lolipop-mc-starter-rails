module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class Ruby < Base
            def check
              stdout = `ruby -v`
              raise "マネージドクラウドがサポートしているバージョンのRubyがみつかりません [#{stdout.strip}]" unless stdout.match(/ruby 2\.[56]\.\d/)
              config = load_config
              config['ruby'] = stdout.strip
              dump_config(config)
              "マネージドクラウドがサポートしているバージョンのRubyがインストールされています [#{stdout.strip}]"
            end
          end
        end
      end
    end
  end
end
