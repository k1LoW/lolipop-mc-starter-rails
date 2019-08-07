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
              puts '本番環境ではMySQLを利用するためmysql2.gemが必要です'
              puts '以下の2つを実行してください'
              puts '1. まずGemfileに以下のように追記してください。末尾で構いません'
              puts ''
              puts 'group :production do'
              puts "  gem 'mysql2'"
              puts 'end'
              puts ''
              puts '2. 次に `bundle install --without=production` を実行してください'
              puts '`bundle install`が成功したら再度 `mc-rails check` を実行してください'
            end
          end
        end
      end
    end
  end
end
