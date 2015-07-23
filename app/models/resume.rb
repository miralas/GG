class Resume < ActiveRecord::Base
  belongs_to :user
  has_one :resume_contact
  has_one :resume_course
  has_one :resume_exam
  has_one :resume_post
  has_one :resume_recomendation
  has_one :resume_work

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
