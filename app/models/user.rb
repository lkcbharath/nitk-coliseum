class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :team_detail
  accepts_nested_attributes_for :team_detail
  validates_associated :team_detail

  has_many :responses
  has_and_belongs_to_many :questions


  def time_interval?
    t1 = Time.new(2019, 02, 21, 21, 00, 00, "+05:30")
    t2 = Time.new(2020, 02, 22, 12, 00, 00, "+05:30")
    Time.now.between?(t1, t2)
  end

  def start_quiz
    self.started_quiz = true
    self.questions << Question.order("RAND()").limit(20)
    self.save
  end

  def on_create_response_user(given,correct)
    self.answered_responses += 1
    if given == correct
      self.right_responses += 1
    end

    self.save
  end

  def calculate_total_time_taken
    self.responses.each do |r|
      self.total_time_taken += r.time_taken.to_i
    end
    self.save
  end



end
