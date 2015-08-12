class Resume < ActiveRecord::Base
  belongs_to :user
  has_one :resume_contact, dependent: :destroy
  has_one :resume_course, dependent: :destroy
  has_many :resume_exam, dependent: :destroy
  has_one :resume_post, dependent: :destroy
  has_many :resume_recomendation, dependent: :destroy
  has_many :resume_work, dependent: :destroy

  after_create :create_symlinks

  private

  	def create_symlinks
  		# binding.pry
  		contact = ResumeContact.new
  		course = ResumeCourse.new
  		exam = ResumeExam.new
  		post = ResumePost.new
  		recomendation = ResumeRecomendation.new
  		work = ResumeWork.new
  		contact.resume = course.resume = exam.resume = post.resume = recomendation.resume = work.resume = self
  		contact.save
  		course.save
  		exam.save
  		post.save
  		recomendation.save
  		work.save
  	end
end
