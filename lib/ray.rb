module Rend
  class Ray
    attr_accessor :pos, :vec, :picture_pos

    def initialize(p, v)
      @pos = p
      @vec = v
    end

    def point_at(t)
      p = Vector::elements @pos
      v = Vector::elements @vec

      return (p+v*t).to_a
    end
  end
end
