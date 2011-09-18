require 'test/unit'
require 'test/helpers'

class TestAssertionHelpers < Test::Unit::TestCase
  class A
    attr_accessor :x, :y
  end

  class Aother
    attr_accessor :x, :y
  end

  class B
    attr_accessor :x, :z
  end

  class C
    attr_accessor :c, :d
  end

  class D
    attr_accessor :x, :y, :z
  end

  def setup
  end

  def test_A_same
    a1 = A.new; a1.x = 5; a1.y = 'xyz'
    a2 = A.new; a2.x = 5; a2.y = 'xyz'

    assert cmp_instance(a1, a2)
  end

  def test_A_different
    a1 = A.new; a1.x = 5; a1.y = 'xyz'
    a2 = A.new; a2.x = 5; a2.y = 'abc'

    assert_equal false, cmp_instance(a1, a2)
  end

  def test_A_other
    a1 = A.new; a1.x = 5; a1.y = 'xyz'
    a2 = Aother.new; a2.x = 5; a2.y = 'xyz'

    assert cmp_instance(a1, a2)
  end

  def test_A_B
    a = A.new; a.x = 5; a.y = 'xyz'
    b = B.new; b.x = 5; b.z = 'xyz'

    assert_equal false, cmp_instance(a, b)
  end

  def test_A_C
    a = A.new; a.x = 5; a.y = 'xyz'
    b = C.new; b.c = 5; b.d = 'xyz'

    assert_equal false, cmp_instance(a, b)
  end

  def test_A_D
    a = A.new; a.x = 5; a.y = 'xyz'
    b = D.new; b.x = 5; b.y = 'xyz'; b.z = :test

    assert_equal true, cmp_instance(a, b)
  end
end 
