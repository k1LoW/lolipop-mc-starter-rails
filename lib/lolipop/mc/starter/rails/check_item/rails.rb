module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class Rails < Base
            def check
              begin 
                stdout = `#{Dir.pwd}/bin/rails -v`
              rescue => e
                raise "Railsコマンドがインストールされていません #{e.message}"
              end
              raise 'Railsのバージョンが5.2.xではありません' unless stdout.match(/5\.2/)
              config = load_config
              config['rails'] = stdout.strip
              dump_config(config)
              "Rails5.2がインストールされています [#{stdout.strip}]"
            end
          end
        end
      end
    end
  end
end
