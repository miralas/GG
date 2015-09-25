ThinkingSphinx::Index.define :resume_post, :with => :active_record do
  indexes wish_post, :sortable => true
end