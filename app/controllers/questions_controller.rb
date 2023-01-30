class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else  
      flash.now[:alert] = 'Поля вопроса заполнены неверно!'

      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос изменен!'
    else  
      flash.now[:alert] = 'Поля вопроса заполнены неверно!'

      render :new
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.update(hidden: true)

    redirect_to(root_path)
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
