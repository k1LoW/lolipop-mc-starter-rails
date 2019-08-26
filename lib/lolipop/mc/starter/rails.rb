require 'dry/inflector'
require 'paint'
require 'yaml'
require 'tty-prompt'
require 'open3'
require 'net/http'
require 'uri'
require 'json'

require 'lolipop/mc/starter/rails/version'
require 'lolipop/mc/starter/rails/config'
require 'lolipop/mc/starter/rails/cli'

module Lolipop
  module Mc
    module Starter
      module Rails
        class Error < StandardError; end
      end
    end
  end
end
