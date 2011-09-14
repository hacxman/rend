require 'yaml'
require 'open-uri'

module Rend
  class SceneLoader
    def initialize
    end

    def load filename
      doc = YAML::load(open(filename))
      doc ||= []
      return doc
    end
  end
end
