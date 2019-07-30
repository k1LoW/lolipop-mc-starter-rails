module Lolipop
  module Mc
    module Starter
      module CheckItem
        class Git < Base
          def check
            begin
              stdout = `git version`
            rescue => e
              raise "Gitコマンドがみつかりません #{e.message}"
            end            
            raise "Gitコマンドが古いです #{stdout.strip}" unless stdout.match(/git version 2/)
            config = load_config
            config['git'] = stdout.strip
            dump_config(config)
            "Gitコマンドがインストールされています [#{stdout.strip}]"
          end
        end
      end
    end
  end
end
