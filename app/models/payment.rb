class Payment < ActiveRecord::Base
  include AASM

  validates_presence_of :user_id, :amount
  # attr_accessible :amount
  belongs_to :user

  default_scope { order("id desc") }

  aasm do
    state :new, :initial => true
    state :success
    state :fail

    event :to_success, :after => :give_money! do
      transitions :to => :success
    end

    event :to_fail do
      transitions :to => :fail
    end
  end

  def state
    self.aasm_state
  end

  def give_money!
    self.user.give_money!(self.amount)
  end

  def printable_amount
    "#{self.amount.to_s} руб."
  end
end