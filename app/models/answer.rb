class Answer < ActiveRecord::Base
  belongs_to :question

  validates :is_correct, uniqueness: true
end
