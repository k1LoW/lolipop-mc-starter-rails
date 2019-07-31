module Lolipop
  module Mc
    module Starter
      module CheckItem
        class GitRemote < Base
          def check
            begin
              stdout = `git remote`
            rescue => e
              raise "Gitコマンドがみつかりません #{e.message}"
            end
            raise "リモートリポジトリ `lolipop` がないようです #{stdout.strip}" unless stdout.match(/lolipop/)
            'リモートリポジトリ `lolipop` が設定されています'
          end

          def hint
            puts 'マネージドクラウドにデプロイするためにマネージドクラウド側のGitリポジトリをリモートリポジトリとして登録する必要があります'
            puts 'マネージドクラウドのプロジェクト詳細に `リポジトリ` にコマンドの記載があります'
            puts '例: `git remote add lolipop ssh://dreamy-kanoya-1234@ssh-1.mc.lolipop.jp:123456/`'
          end
        end
      end
    end
  end
end
