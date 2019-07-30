module Lolipop
  module Mc
    module Starter
      module CheckList
        require 'lolipop/mc/starter/check_item/base'
        require 'lolipop/mc/starter/check_item/git'
        require 'lolipop/mc/starter/check_item/ruby'
        require 'lolipop/mc/starter/check_item/rails_dir'
        require 'lolipop/mc/starter/check_item/rails'

        LIST = [
          Lolipop::Mc::Starter::CheckItem::Git,
          Lolipop::Mc::Starter::CheckItem::Ruby,
          Lolipop::Mc::Starter::CheckItem::RailsDir,
          Lolipop::Mc::Starter::CheckItem::Rails
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
