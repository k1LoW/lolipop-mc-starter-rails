require 'thor'
require 'lolipop/mc/starter/rails/check_list'
require 'lolipop/mc/starter/rails/generators'

module Lolipop
  module Mc
    module Starter
      module Rails
        class CLI < Thor
          desc 'check', 'Railsプロジェクトのディレクトリで実行することで、マネージドクラウドへのデプロイに必要な設定をチェックします'
          def check
            Lolipop::Mc::Starter::Rails::CheckList.check_all
          end

          desc 'database', 'Railsのデータベース設定に必要な環境変数 `DATABASE_URL` を簡単に作成します'
          def database
            Lolipop::Mc::Starter::Rails::Generators::DatabaseURL.run
          end

          option :version, type: :boolean, aliases: :v
          def help(version = nil)
            if version
              puts Lolipop::Mc::Starter::Rails::VERSION
            else
              super
            end
          end
        end
      end
    end
  end
end
