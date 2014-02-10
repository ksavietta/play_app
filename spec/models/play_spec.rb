require 'spec_helper'

describe Play do
  it {should have_many :roles}

  it 'should have a method that returns 10 roles by number of lines spoken'

  it 'should have a method that returns 10 roles by longest speech'

  it 'should have a method that returns 10 roles by number of scenes in which the role appears'

  it 'should have a method that returns 10 roles by percent of total scenes in which the role appears'

end
