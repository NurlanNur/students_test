class AnswersController < ApplicationController


  def index
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answers = @question.answers
  end

  # def show
  #   @test = Test.find(params[:test_id])
  #   @question = @test.questions(params[:id])
  #
  # end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer = @question.answers.build
  end

  def edit
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def create

    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    if @answer.save
      flash[:notice] = "Ответ #{@answer.answer} успешно создан!"
      redirect_to test_question_answers_path(@test,@question)
    else
      render 'new'
    end

  end

  def update

    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])

    if @answer.update(answer_params)
      flash[:notice] = 'Ответ успешно обновлен!'
      redirect_to test_question_answers_path(@test,@question)
    else
      render 'edit'
    end

  end

  def destroy
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer = Answer.destroy(params[:id])
    redirect_to test_question_answers_path(@test,@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:answer, :is_correct, :id, :question_id, :test_id)
  end
end
