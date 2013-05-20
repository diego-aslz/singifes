module SIGAA
  class Person < ActiveRecord::Base
    include DatabaseHelper::SIGAA
    self.table_name = 'comum.pessoa'
  end
end
