module COMUM
  class Person < ActiveRecord::Base
    include DatabaseHelper::COMUM
    self.table_name = 'comum.pessoa'
    self.primary_key = :id_pessoa
  end
end
