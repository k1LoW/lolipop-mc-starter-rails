module Lolipop
  module Mc
    module Starter
      module Rails
        module CheckItem
          class Ruby < Base
            def check
              stdout = `ruby -v`
              raise "マネージドクラウドがサポートしているバージョンのRubyがみつかりません [#{stdout.strip}]" unless stdout.match(/ruby 2\.[56]\.\d/)
              config = @config.load
              config['ruby'] = stdout.strip
              @config.dump(config)
              "マネージドクラウドがサポートしているバージョンのRubyがインストールされています [#{stdout.strip}]"
            end

            def hint
              puts 'マネージドクラウドがサポートしているRuby2.6.xかRuby2.5.xをインストールしてください'
              puts 'マネージドクラウドで作成するRailsプロジェクトのRubyのバージョンと合わせるのが望ましいです'
            end
          end
        end
      end
    end
  end
end
