require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


class Users

  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    Users.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    Users.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Questions.find_by_author_id(self.id)
  end

  def authored_replies
    Replies.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLikes.liked_questions_for_user_id(self.id)
  end

  def average_karma
    average_karma = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        COUNT(questions.id) / CAST(COUNT(DISTINCT(questions.id)) AS FLOAT)
        --num_questions --likes_on questions
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_id
      WHERE
        author_id = ?
    SQL
    average_karma.first.values.first
  end

  def save
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

end

class Questions

  attr_accessor :id, :title, :body, :author_id

  def self.find_by_id(id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Questions.new(question.first)
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless questions.length > 0


    questions.map{ |question| Questions.new(question) }
  end

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    Users.find_by_id(author_id)
  end

  def replies
    Replies.find_by_question_id(self.id)
  end

  def followers
    QuestionFollows.followers_for_question_id(self.id)
  end

  def likers
    QuestionLikes.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(self.id)
  end

  def save
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

end

class QuestionFollows

  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    question_follow = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless question_follow.length > 0

    QuestionFollows.new(question_follow.first)
  end

  def self.followers_for_question_id(question_id)
    question_follows = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON user_id = users.id
      JOIN
        questions ON question_id = questions.id
      WHERE
        question_id = ?
    SQL

    question_follows.map{ |question_follow| Users.new(question_follow)}
  end

  def self.followed_questions_for_user_id(user_id)
    question_follows = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON question_id = questions.id
      JOIN
        users ON user_id = users.id
      WHERE
        user_id = ?
    SQL

    question_follows.map{ |question_follow| Questions.new(question_follow)}
  end

  def self.most_followed_questions(n)
    question_follows = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON question_id = questions.id
      JOIN
        users ON user_id = users.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_id) DESC
      LIMIT ?
    SQL

    question_follows.map{ |question_follow| QuestionFollows.new(question_follow)}
  end

  def initialize(options)
    @id = options['id']
    @user_id= options['user_id']
    @question_id = options['question_id']
  end

end


class Replies

  attr_accessor :id, :question_id, :parent_id, :user_id, :reply_body

  def self.find_by_id(id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Replies.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless replies.length > 0

    replies.map{ |reply| Replies.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless replies.length > 0

    replies.map{ |reply| Replies.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @reply_body = options['reply_body']
  end

  def author
    Users.find_by_id(user_id)
  end

  def question
    Questions.find_by_id(question_id)
  end

  def parent_reply
    Replies.find_by_id(parent_id)
  end

#find the resplies whose parent_id == id
  def child_replies
  replies = QuestionsDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_id = ?
    SQL

    replies.map { |reply| Replies.new(reply)}
  end

  def save
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @reply_body)
      INSERT INTO
        replies (question_id, parent_id, user_id, reply_body)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

end

class QuestionLikes

  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    question_like = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless question_like.length > 0

    QuestionLikes.new(question_like.first)
  end

  def self.likers_for_question_id(question_id)
    question_like = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_likes ON user_id = users.id
      JOIN
        questions ON question_id = questions.id
      WHERE
        question_id = ?
    SQL
    question_like.map { |question_like| Users.new(question_like) }
  end

  def self.num_likes_for_question_id(question_id)
    num_of_likes = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(user_id)
      FROM
        users
      JOIN
        question_likes ON user_id = users.id
      JOIN
        questions ON question_id = questions.id
      WHERE
        question_id = ?
    SQL

    num_of_likes.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        questions.title
      FROM
        questions
      JOIN
        question_likes ON question_id = questions.id
      JOIN
        users ON user_id = users.id
      WHERE
        user_id = ?
    SQL

    liked_questions.map{ |liked_question| Questions.new(liked_question) }
  end

  def self.most_liked_questions(n)
    most_liked = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes ON question_id = questions.id
      JOIN
        users ON user_id = users.id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_id) DESC
      LIMIT ?
    SQL

    most_liked.map { |most_liked| Questions.new(most_liked)}
  end

  def initialize(options)
    @id = options['id']
    @user_id= options['user_id']
    @question_id = options['question_id']
  end



end
