ThinkingSphinx::Index.define :vacancy, :with => :active_record do
  indexes title, :sortable => true
  indexes requirements
  indexes description
end