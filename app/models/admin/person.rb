module ADMIN
  class Person < ActiveRecord::Base
    include DatabaseHelper::ADMIN
    self.table_name = 'comum.pessoa'
    self.primary_key = :id_pessoa
  end
end
