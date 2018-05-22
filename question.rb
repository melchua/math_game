# question.rb - evaluate question and return true if correct, false if not
class Question
  def initialize
    @num1 = 1 + rand(20)
    @num2 = 1 + rand(20)
    @result = @num1 + @num2
  end

  def ask_question
    "What is the sum of #{@num1} and #{@num2}?"
  end

  def generate_question
    @num1 = 1 + rand(20)
    @num2 = 1 + rand(20)
    @result = @num1 + @num2
  end

  def evaluate_question(q)
    q == @result ? true : false
  end
end

