class ResumeAnswer < ActiveRecord::Base
  belongs_to :resume
  belongs_to :company
end
