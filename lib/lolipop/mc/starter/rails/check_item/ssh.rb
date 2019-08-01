module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class SSH < Base
            def check
              config = load_config
              ssh_command = config['ssh']

              if ssh_command != NOCHECK
                begin
                  stdout = `#{ssh_command} hostname`
                rescue => e
                  puts "SSHコマンドの実行に失敗しました。SSH接続の設定を確認してください #{e.message}"
                  ssh_command = ''
                end
              end

              if [NOCHECK, ''].include?(ssh_command)
                prompt = TTY::Prompt.new(active_color: :cyan)
                ssh_command = prompt.ask('SSHコマンドを入力してください(マネージドクラウドのプロジェクト詳細に記載があります):')
                begin
                  stdout = `#{ssh_command} hostname`
                rescue => e
                  raise "SSHコマンドの実行に失敗しました。SSH接続の設定を確認してください #{e.message}"
                end
              end
              raise 'SSHコマンドの実行に失敗しました。入力したコマンドを確認してください' unless stdout.match(/^gitpush-ruby.+lolipop\.io/)
              config['ssh'] = ssh_command
              dump_config(config)
              "SSHコマンドの設定が完了しています [#{ssh_command}]"
            end

            def hint
              puts 'マネージドクラウドのプロジェクト詳細に `SSHコマンド` に記載があります'
              puts '例: `ssh -p 123456 dreamy-kanoya-1234@ssh-1.mc.lolipop.jp'
              puts ''
              puts 'もし `SSHコマンド` を入力してもSSHコマンドの実行失敗する場合は以下の点を確認してみてください'
              puts '- マネージドクラウドに公開鍵を設定しているか?'
              puts '- 秘密鍵を~/.ssh/に設置しているか?'
              puts '- ~/.ssh/config の設定をしているか?'
            end
          end
        end
      end
    end
  end
end
