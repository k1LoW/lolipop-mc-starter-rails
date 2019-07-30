require 'thor'

module Lolipop
  module Mc
    module Starter
      class CLI < Thor
        desc 'check', 'Check your Rails project'
        def check
          puts "call check"
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
