module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class RailsKey < Base
            def check
              key_path = "#{Dir.pwd}/config/master.key"
              raise 'config/master.keyがありません' unless File.exist?(key_path)
              'config/master.keyがあります'
            end

            def hint
              puts 'Rails5.2ではconfig/master.keyでconfig/credentials.yml.encを暗号化/復号化します'
              puts 'config/master.keyもconfig/credentials.yml.encもない状態で `bin/rails credentials:edit` を実行することで新たにconfig/master.keyとconfig/credentials.yml.encを生成できます'
            end
          end
        end
      end
    end
  end
end
