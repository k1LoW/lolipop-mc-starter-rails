require 'tty-prompt'

module Lolipop::Mc::Starter::Rails
  module Generators
    module DatabaseURL
      def self.run
        puts 'マネージドクラウドのプロジェクト詳細ページを開き、データベースの情報を確認しながら以下を入力してください。'
        prompt = TTY::Prompt.new(active_color: :cyan)
        database = prompt.ask('データベース名: ')
        user = prompt.ask('ユーザー名: ')
        password = prompt.mask('パスワード(プロジェクト作成時に入力したものです): ')
        host = prompt.ask('データベースのホスト名: ')
        uri = URI::Generic.build(['mysql2', user, host, 3306, nil, "/#{database}", nil, nil, nil])
        uri.password = password

        puts '以下の内容を、プロジェクト詳細ページの「環境変数の設定と管理」から登録してください。'
        puts '新しい環境変数(名前): ' + prompt.decorate('DATABASE_URL', :bold, :magenta)
        puts '新しい環境変数(値): ' + prompt.decorate(uri.to_s, :bold, :magenta)
        puts '登録後、再び `mc-rails check` を実行してください。'
      end
    end
  end
end
