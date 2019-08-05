module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class GemMysql2 < Base
            def check
              gemfile_path = "#{Dir.pwd}/Gemfile"
              raise 'Gemfileがありません' unless File.exist?(gemfile_path)
              content = File.read(gemfile_path)
              raise 'Gemfileでgem `mysql2`が呼ばれていません' unless content.match("gem 'mysql2'")
              'Gemfileでgem `mysql2`が呼ばれています'
            end

            def hint
              puts 'マネージドクラウドのRailsプロジェクトはMySQLが利用できます'
              puts "本番環境ではMySQLを利用するためGemfileに`gem 'mysql2'`の記載が必要です"
            end
          end
        end
      end
    end
  end
end
