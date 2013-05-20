class Person < ActiveRecord::Base
  include DatabaseHelper::Pingifes
  self.table_name = 'PESSOA'
end
