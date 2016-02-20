class QuestionsController < ApplicationController

  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions
  end

  # def show
  #   @test = Test.find(params[:test_id])
  #   @question = @test.questions(params[:id])
  #
  # end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.build
  end

  def edit
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
  end

  def create

    @test = Test.find(params[:test_id])
    @question = @test.questions.create(question_params)
    if @question.save
      flash[:notice] = "Вопрос #{@question.question} успешно создан!"
      redirect_to test_questions_path(@test)
    else
      render 'new'
    end

  end

  def update

    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = 'Вопрос успешно обновлен!'
      redirect_to test_questions_path(@test)
    else
      render 'edit'
    end

  end

  def destroy
    @test = Test.find(params[:test_id])
    @question = Question.destroy(params[:id])
    redirect_to test_questions_path(@test)
  end

  private
  def question_params
    params.require(:question).permit(:question, :id, :test_id)
  end

end
