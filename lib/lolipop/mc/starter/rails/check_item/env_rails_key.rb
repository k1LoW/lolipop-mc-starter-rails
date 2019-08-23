module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class EnvRailsKey < Base
            def check
              key_path = "#{Dir.pwd}/config/master.key"
              raise 'config/master.keyがありません' unless File.exist?(key_path)

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
              raise '環境変数 `RAILS_MASTER_KEY` が設定されていません' unless stdout.match(/RAILS_MASTER_KEY/)
              key = File.read(key_path)
              raise '環境変数 `RAILS_MASTER_KEY` の値がconfig/master.keyと異なります' unless stdout.match("RAILS_MASTER_KEY=#{key}")
              '環境変数 `RAILS_MASTER_KEY` が設定されています'
            end

            def hint
              puts 'Railsではconfig/credentials.yml.encの情報を復号化して読み取るためにconfig/master.keyが必要です'
              puts 'config/master.keyを本番環境に設置する代わりに、環境変数 `RAILS_MASTER_KEY` にconfig/master.keyの値を設定することが可能です'
              puts 'マネージドクラウドのプロジェクト詳細の `環境変数の設定と管理` で環境変数 `RAILS_MASTER_KEY` にconfig/master.keyの値を追加してください'
            end
          end
        end
      end
    end
  end
end
