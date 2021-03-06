class WordListsController < ApplicationController
  before_action :set_word_list, only: [:show, :edit, :update, :destroy,
                                       :random_word, :training, :testing, :test_result]

  # GET /word_lists
  # GET /word_lists.json
  def index
    @word_lists = WordList.all
  end

  # GET /word_lists/1
  # GET /word_lists/1.json
  def show
    @words = @word_list.words
    respond_to do |format|
      format.html {}
      format.json {
        @words_collection = @words.map{|w| {english_word: w.english_word, value: w.value}}
        render json: {words: @words_collection}
      }
    end
  end

  def training
    @words = @word_list.words
    @first_word = @words.sample
    respond_to do |format|
      format.html {}
      format.json {
        @words_collection = @words.map{|w| {english_word: w.english_word, value: w.value}}
        render json: {words: @words_collection}
      }
    end
  end

  def testing
    @words = @word_list.words
  end

  def test_result
    words = @word_list.words
    correct_answers = 0
    answers_array = []
    words.each do |word|
      answer = params["word_#{word.id}"]
      answer_array = []
      answer_array << word.english_word
      answer_array << params["word_#{word.id}"]
      answer_array << word.check_answer(answer)
      answers_array << answer_array
      if word.check_answer(answer)
        correct_answers += 1
      end
    end
    @correct = correct_answers
    @words_count = words.count
    @answer_array = answers_array
  end

  # GET /word_lists/new
  def new
    @word_list = WordList.new
  end

  # GET /word_lists/1/edit
  def edit
  end

  # POST /word_lists
  # POST /word_lists.json
  def create
    @word_list = WordList.new(word_list_params)

    respond_to do |format|
      if @word_list.save
        format.html { redirect_to @word_list, notice: 'Список для запоминания успешно создан.' }
        format.json { render :show, status: :created, location: @word_list }
      else
        format.html { render :new }
        format.json { render json: @word_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_lists/1
  # PATCH/PUT /word_lists/1.json
  def update
    respond_to do |format|
      if @word_list.update(word_list_params)
        format.html { redirect_to @word_list, notice: 'Список для запоминания успешно обновлен.' }
        format.json { render :show, status: :ok, location: @word_list }
      else
        format.html { render :edit }
        format.json { render json: @word_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_lists/1
  # DELETE /word_lists/1.json
  def destroy
    @word_list.destroy
    respond_to do |format|
      format.html { redirect_to word_lists_url, notice: 'Список для запоминания успешно удален.' }
      format.json { head :no_content }
    end
  end

  def random_word
   @word = @word_list.words.sample

    respond_to do |format|
      format.html {}
      format.json  {
        render json: {english_word: @word.english_word, value: @word.value}
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_list
      @word_list = WordList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_list_params
      params.require(:word_list).permit(:name, :list_type, words_attributes:[:id, :english_word, :value, :_destroy])
    end
end
