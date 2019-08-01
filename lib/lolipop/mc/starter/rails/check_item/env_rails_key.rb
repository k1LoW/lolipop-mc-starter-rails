module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class EnvRailsKey < Base
            def check
              key_path = "#{Dir.pwd}/config/master.key"
              raise 'config/master.keyがありません' unless File.exist?(key_path)

              config = load_config
              ssh_command = config['ssh']
              if ssh_command == NOCHECK
                raise 'SSHコマンドの実行に失敗しました。SSH接続の設定を確認してください'
              end
              begin
                stdout = `#{ssh_command} env`
              rescue => e
                raise "SSHコマンドの実行に失敗しました。SSH接続の設定を確認してください #{e.message}"
              end
              raise '環境変数 `RAILS_MASTER_KEY` が設定されていません' unless stdout.match(/RAILS_MASTER_KEY/)
              key = File.read(key_path)
              raise '環境変数 `RAILS_MASTER_KEY` の値がconfig/master.keyと異なります' unless stdout.match("RAILS_MASTER_KEY=#{key}")
              '環境変数 `RAILS_MASTER_KEY` が設定されています'
            end
          end
        end
      end
    end
  end
end
