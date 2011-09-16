require 'yaml'
require 'open-uri'

require 'objects'

module Rend
  class SceneLoader
    def initialize
    end

    def load filename
      doc = YAML::load(open(filename))
      doc ||= []
      
      scene = {}
      doc.map do |item|
        x = item.map do |j|
          instn = nil
          case j[0]
          when "camera"
            instn = Rend::Camera.new
          when "sphere"
            instn = Rend::Sphere.new
          end
          j[1].each do |var,val|
            instn.instance_variable_set "@#{var}", val
          end
          instn
        end [0]
        {x.name, x}
      end.reduce(Hash.new) {|a,b| a.merge b}

    end
  end
end
