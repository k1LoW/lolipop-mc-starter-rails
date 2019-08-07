module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class EnvRuby < Base
            def check
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
              version = '0.0.0'
              md = stdout.match(/RUBY_VERSION=(\d\.\d\.\d)/)
              if md
                version = md[1]
              else
                raise '環境変数 `RUBY_VERSION` が設定されていません。マネージドクラウドのプロジェクトがRailsプロジェクトではない可能性があります'
              end
              local_version = config['ruby']
              "マネージドクラウドのRailsプロジェクトのRubyのバージョンとローカルのRubyのバージョンが同じでないようです\nマネージドクラウド:#{version} ローカル:#{local_version}" unless local_version.include?(version)

              gemfile_path = "#{Dir.pwd}/Gemfile"
              raise 'Gemfileがありません' unless File.exist?(gemfile_path)
              content = File.read(gemfile_path)
              raise 'Gemfileに指定してあるRubyのバージョンとローカルのRubyのバージョンが同じでないようです' unless content.include?("ruby '#{version}'")

              'マネージドクラウドのRailsプロジェクトのRubyのバージョンとローカルのRubyのバージョンが同じです'
            end

            def hint
              puts 'ローカルのRubyのバージョンとマネージドクラウドのRailsプロジェクトのRubyのバージョンを合わせる必要があります'
              puts 'マネージドクラウドのプロジェクト詳細でRubyのバージョンを確認して、同じRubyをインストールしてください'
            end
          end
        end
      end
    end
  end
end
