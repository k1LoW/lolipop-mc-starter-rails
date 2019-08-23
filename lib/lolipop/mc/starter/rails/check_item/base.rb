module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class Base
            def initialize
              @item_name = item_name
              @config = Lolipop::Mc::Starter::Rails::Config
            end

            def item_name
              inflector = Dry::Inflector.new
              inflector.underscore(self.class.to_s.split('::').last)
            end

            def desc
              "call #{@item_name} desc"
            end

            def check
              "call #{@item_name} check"
            end

            def hint
              puts "まだ #{@item_name} のヒントが書かれていません"
            end
          end
        end
      end
    end
  end
end
