class Teacher < Person
  attr_accessor :sepcialization

  def initialize(age, sepcialization, name = 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @sepcialization = sepcialization
  end

  def can_use_services?
    true
  end

  def self.from_hash(hash)
    new(hash['age'], hash['sepcialization'], hash['name'], parent_permission: hash['parent_permission'])
  end
end
