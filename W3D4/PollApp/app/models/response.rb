# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_one :parent_question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def question
    self.parent_question
  end

  def respondent_already_answered?
    self.sibling_responses.exists?(user_id: self.user_id)
  end

  private

  def not_duplicate_response
    if self.respondent_already_answered?
      errors[:base] << "No duplicate responses!"
    end
  end

  #TODO: Work on this custom validation
  def author_cant_answer_poll
    self.answer_choice.question.poll.exists?(author_id: self.user_id)
  end

end
