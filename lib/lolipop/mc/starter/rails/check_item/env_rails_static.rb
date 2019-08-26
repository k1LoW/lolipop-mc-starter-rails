module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class EnvRailsStatic < Base
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
              raise '環境変数 `RAILS_SERVE_STATIC_FILES` が設定されていません' unless stdout.match(/RAILS_SERVE_STATIC_FILES=/)
              raise '環境変数 `RAILS_SERVE_STATIC_FILES` が `true` ではありません' unless stdout.match("RAILS_SERVE_STATIC_FILES=true")
              '環境変数 `RAILS_SERVE_STATIC_FILES=true` が設定されています'
            end

            def hint
              puts 'Railsは環境変数に `RAILS_SERVE_STATIC_FILES=true` を設定すると public/ ディレクトリの静的ファイルをNGINXやApache直接ではなくRailsが配信するようになります'
              puts 'マネージドクラウドでは静的ファイルの配信もRailsで実施する必要があります'
              puts 'マネージドクラウドのプロジェクト詳細の `環境変数の設定と管理` で環境変数 `RAILS_SERVE_STATIC_FILES` (値 `true` ) を追加してください'
            end
          end
        end
      end
    end
  end
end
