module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class Git < Base
            def check
              begin
                stdout = `git version`
              rescue => e
                raise "Gitコマンドがみつかりません #{e.message}"
              end            
              raise "Gitコマンドが古いです #{stdout.strip}" unless stdout.match(/git version 2/)
              config = load_config
              config['git'] = stdout.strip
              dump_config(config)
              "Gitコマンドがインストールされています [#{stdout.strip}]"
            end

            def hint
              puts 'ソースコードをバージョン管理するためにGitコマンドを利用します'
              puts 'またマネージドクラウドのRailsプロジェクトではデプロイの仕組みにGitを活用しています'
              puts 'Macであれば `brew install git` コマンドなどでGitをインストールしてください'
            end
          end
        end
      end
    end
  end
end
