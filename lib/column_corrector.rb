module ColumnCorrector
  def self.included(base)
    base.column_names.each do |col|
      base.alias_attribute col.underscore.to_sym, col.to_sym
    end
  end
end
