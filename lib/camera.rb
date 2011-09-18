require 'matrix'

class Vector
  def cross v
    Vector.elements([ 
      self[1]*v[2] - self[2]*v[1],
      self[2]*v[0] - self[0]*v[2],
      self[0]*v[1] - self[1]*v[0]
    ])
  end
end

module Rend
  
  class Camera
    attr_accessor :name, :pos, :size, :up, :focal_point

    def create_rays(resolution)
      xs, ys = resolution
      unless xs > 0 || ys > 0
        throw "incorrect resolution: #{resolution}"
      end

      va = Vector.elements(focal_point)*(-1)
      vb = Vector.elements(up)
      right = va.cross(vb)
      right = right * (1.0 / right.r)
      bottm = vb * (-1)

      rays = []

      xs.times do |i|
        ys.times do |j|
          rv = right * (Float(i) / xs) * @size[0]
          bv = bottm * (Float(j) / ys) * @size[1]
          nv = (rv + bv) - Vector.elements(@focal_point)
          r  = Ray.new(@focal_point, nv.to_a)
          r.picture_pos = [i, j]
          rays << r
        end
      end

      rays
    end
  end
end
