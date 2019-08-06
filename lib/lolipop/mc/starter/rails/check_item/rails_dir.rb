module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class RailsDir < Base
            def check
              %w(Rakefile app bin config config.ru db lib log public tmp vendor).each do |f|
                raise 'カレントディレクトリにRailsプロジェクトのソースコードが設置されていません' unless File.exist?("#{Dir.pwd}/#{f}")
              end
              if %(test spec).all? {|d| !File.exist?("#{Dir.pwd}/#{f}") }
                raise 'カレントディレクトリにRailsプロジェクトのソースコードが設置されていません。テストコード用のディレクトリはありますか？'
              end
              'カレントディレクトリにRailsプロジェクトのソースコードが設置されてます'
            end

            def hint
              puts 'Railsプロジェクトのソースコードが設置されているディレクトリに移動して、もう一度 `mc-rails check` を実行してください'
              puts 'もしくは、 `rails new your_app` コマンドでRailsプロジェクトを新規作成してください'
            end
          end
        end
      end
    end
  end
end
