module Lolipop
  module Mc
    module Starter
      module CheckItem
        class RailsKey < Base
          def check
            key_path = "#{Dir.pwd}/config/master.key"
            raise 'config/master.keyがありません' unless File.exist?(key_path)
            'config/master.keyがあります'
          end
        end
      end
    end
  end
end
