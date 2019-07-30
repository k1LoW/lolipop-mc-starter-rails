require 'thor'
require 'lolipop/mc/starter/check_list'

module Lolipop
  module Mc
    module Starter
      class CLI < Thor
        desc 'check', 'Check your Rails project'
        def check
          Lolipop::Mc::Starter::CheckList.check_all
        end

        option :version, type: :boolean, aliases: :v
        def help(version = nil)
          if version
            puts Lolipop::Mc::Starter::VERSION
          else
            super
          end
        end
      end
    end
  end
end
