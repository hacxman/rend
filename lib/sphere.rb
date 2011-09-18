require 'matrix'

module Rend
  class Sphere
    attr_accessor :name, :pos, :size

    def intersect_ray(ray)
      c = Vector::elements(@pos)
      l = Vector::elements(ray.vec)
      v = Vector::elements(ray.pos)

      lc = c.inner_product(l)
      lv = v.inner_product(l)
      vv = v.inner_product(v)
      vc = c.inner_product(v)
      cc = c.inner_product(c)
      ll = l.inner_product(l)

      # ||c - x||^2 = r^2
      # x = dl + v
      # ||c - (v + dl)||^2 = r^2
      # (c - v - dl)(c - v - dl) = rr
      # cc - vc - dlc - cv + vv + dlv - dlc + dlv + ddll = rr
      # ddll + d*2(lv-lc) - 2vc + vv + cc - rr = 0
      #
      # D = 4(lv-lc)^2 - 4ll(-2vc+vv+cc-rr)
      #
      #         -2(lv-lc) +- sqrt(D)
      # d1,2 = ----------------------
      #                 2ll
      
      diskr = 4*(lv-lc)**2 - 4*ll*(-2*vc+vv+cc-size*size)

      if diskr < 0
        return nil
      end
      d1 = (-2*(lv-lc) + Math.sqrt(diskr)) / (2*ll)
      d2 = (-2*(lv-lc) - Math.sqrt(diskr)) / (2*ll)

      return [ray.point_at(d1), d1] if d1 > 0 && d1 < d2
      return [ray.point_at(d2), d2]

    end
  end
end
