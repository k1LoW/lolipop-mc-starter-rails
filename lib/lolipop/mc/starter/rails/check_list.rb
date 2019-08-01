module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckList
          require 'lolipop/mc/starter/rails/check_item/base'
          require 'lolipop/mc/starter/rails/check_item/git'
          require 'lolipop/mc/starter/rails/check_item/ruby'
          require 'lolipop/mc/starter/rails/check_item/rails_dir'
          require 'lolipop/mc/starter/rails/check_item/ssh'
          require 'lolipop/mc/starter/rails/check_item/rails'
          require 'lolipop/mc/starter/rails/check_item/git_log'
          require 'lolipop/mc/starter/rails/check_item/git_remote'
          require 'lolipop/mc/starter/rails/check_item/rails_key'
          require 'lolipop/mc/starter/rails/check_item/env_rails_key'

          LIST = [
            Lolipop::Mc::Starter::Rails::CheckItem::Git,
            Lolipop::Mc::Starter::Rails::CheckItem::Ruby,
            Lolipop::Mc::Starter::Rails::CheckItem::RailsDir,
            Lolipop::Mc::Starter::Rails::CheckItem::SSH,
            Lolipop::Mc::Starter::Rails::CheckItem::Rails,
            Lolipop::Mc::Starter::Rails::CheckItem::GitLog,
            Lolipop::Mc::Starter::Rails::CheckItem::GitRemote,
            Lolipop::Mc::Starter::Rails::CheckItem::RailsKey,
            Lolipop::Mc::Starter::Rails::CheckItem::EnvRailsKey
          ]

          def self.check_all
            LIST.each do |item|
              i = item.new
              begin
                puts '✅ ' + Paint[i.check, :green].to_s
              rescue => e
                puts '❌ ' + Paint[e.message, :red]
                puts ''
                puts '[ヒント]'
                i.hint
                break
              end
            end
          end
        end
      end
    end
  end
end
