module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class EnvDatabase < Base
            def check
              config = @config.load
              ssh_command = config['ssh']
              if ssh_command == @config::NOCHECK
                raise 'SSHコマンドの実行に失敗しました。SSH接続の設定を確認してください'
              end
              begin
                stdout, stderr, status = Open3.capture3("#{ssh_command} env")
              rescue => e
                raise "SSHコマンドの実行に失敗しました。SSH接続の設定を確認してください #{e.message}"
              end
              raise '環境変数 `DATABASE_URL` が設定されていません' unless stdout.match(/DATABASE_URL=/)
              raise '環境変数 `DATABASE_URL` のアダプターがmysql2ではありません' unless stdout.match("DATABASE_URL=mysql2://")
              '環境変数 `DATABASE_URL` が設定されています'
            end

            def hint
              puts 'Railsは環境変数に `DATABASE_URL` を設定すると config/database.yml ではなく `DATABASE_URL` のDB接続設定を優先します'
              puts 'マネージドクラウドのプロジェクト詳細の `データベース` の記載を組み合わせて `DATABASE_URL` を作成して、同じくマネージドクラウドのプロジェクト詳細の `環境変数の設定と管理` で環境変数 `DATABASE_URL` を追加してください'
              puts 'DATABASE_URL を作成するために、 `mc-rails database` というコマンドを実行し、インストラクションに従って値を入力してください。'
            end
          end
        end
      end
    end
  end
end
