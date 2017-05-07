# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  qtext      :text
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :qtext, :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  has_many :q_responses,
    through: :answer_choices,
    source: :responses

  def responses
    self.q_responses
  end

  def n_1_results
    answers = self.answer_choices

    answer_hash = Hash.new(0)
    answers.each do |answer|
      answer_hash[answer.actext] = answer.responses.count
    end

    answer_hash
  end

  def better_results
    answers = self.answer_choices.includes(:responses)

    answer_hash = Hash.new(0)
    answers.each do |answer|
      answer_hash[answer.actext] = answer.responses.length
    end

    answer_hash

  end

  def even_better_results
    answers = Question
      .select('answer_choices.id, COUNT(*)')
      .joins(:answer_choices)
      .joins(:responses)
      .where('question.id = (?)', self.id)
      .group('answer_choices.id')

    answer_hash = Hash.new(0)
    answers.each do |answer|
      answer_hash[answer.actext] = answer.responses.length
    end

    answer_hash
  end

end


# SELECT
#   answer_choices.id, COUNT(*)
# FROM
#   questions
# JOIN
#   answer_choices ON answer_choices.question_id = questions.id
# JOIN
#   responses ON responses.answer_choice_id = answer_choices.id
# WHERE
#   question.id = ?
# GROUP BY
#   answer_choices.id
