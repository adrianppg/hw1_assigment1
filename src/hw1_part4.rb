### Part IV - basic OOP

class Dessert
def initialize(name, calories)
  @name = name
  @calories = calories
end
attr_accessor :name
attr_accessor :calories
def healthy?
  if calories<200
    return true
  end
  return false
end
def delicious?
  return true
end
end
class JellyBean < Dessert
def initialize(name, calories, flavor)
  super name, calories
  @flavor = flavor
end
attr_accessor :flavor
def delicious?      
  if (flavor.downcase == "black licorice")
    return false
  else
    return super
  end  
end
end