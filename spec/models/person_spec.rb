require 'spec_helper'

describe Person do
  it "has cod_pessoa as primary key" do
    p = Person.first
    Person.find(p.cod_pessoa).cod_pessoa.should be_== p.cod_pessoa
  end
end
