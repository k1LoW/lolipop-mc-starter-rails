module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class GitLog < Base
            def check
              begin
                stdout = `git log`
              rescue => e
                raise "まだローカルのGitリポジトリにコミットがないようです #{e.message}"
              end            
              'ローカルのGitリポジトリにコミットがあります'
            end

            def hint
              puts 'ロリポップ！マネージドクラウドのRailsプロジェクトでは `git push` をすることでマネージドクラウドにRailsアプリケーションをデプロイします'
              puts 'そのためにはローカルのGitリポジトリに`git commit`が必要です'
              puts "`git add . && git commit -m'First commit'` などを実行してコミットを作成してください"
            end
          end
        end
      end
    end
  end
end
