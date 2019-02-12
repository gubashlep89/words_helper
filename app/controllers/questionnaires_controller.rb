class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy, :exam, :exam_result]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  def init_questionnaire

  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.build_questionnaire_with_options(
        questionnaire_params[:options][:question_count],
        questionnaire_params[:options][:answer_count])

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire,
                      notice:
                          'Тест успешно создан, для заполнения вопросов и ответов
                            - пройдите в раздел "Редактировать тест".'}
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Тест успешно обновлен.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Тест успешно удален.' }
      format.json { head :no_content }
    end
  end

  def exam

  end

  def exam_result
    total = {}
    questions_count = 0
    correct_answer_count = 0
    @questionnaire.questions.each  do |question|
      if question.correct_answer.id.to_s == params["question_#{question.id}"]
        result = {'correct' => true}
        correct_answer_count += 1
      else
        result = {'correct' => false, 'incorrect_answer' => params["question_#{question.id}"]}
      end
      questions = {"question#{question.id}" => result}
      total.merge!(questions)
      questions_count += 1
    end
    @correct_answer_count = correct_answer_count
    @questions_count = questions_count
    @total = total
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(
          :title,
          :description,
          options: {},
          questions_attributes:
              [:id,
               :question_text,
               :correct_answer,
               :_destroy,
               question_answers_attributes:
                   [:id,
                    :is_correct_flag,
                    :answer_text,
                    :_destroy
                   ]
              ])
    end
end
