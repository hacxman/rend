
def cmp_instance i1, i2
  i1.instance_variables.map do |var|
    v1 = i1.instance_variable_get var
    v2 = i2.instance_variable_get var
    
    v1 == v2
  end.reduce(true) {|a,b| a and b}
end

def assert_same_data i1, i2
  unless cmp_instance i1, i2
    assert_equal i1, i2
  else
    assert true
  end
end

