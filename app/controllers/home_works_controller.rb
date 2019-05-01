class HomeWorksController < ApplicationController
  before_action :set_home_work, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /home_works
  # GET /home_works.json
  def index
    @home_works = HomeWork.all
  end

  # GET /home_works/1
  # GET /home_works/1.json
  def show
  end

  # GET /home_works/new
  def new
    @home_work = HomeWork.new
  end

  # GET /home_works/1/edit
  def edit
  end

  # POST /home_works
  # POST /home_works.json
  def create
    @home_work = HomeWork.new(home_work_params)

    respond_to do |format|
      if @home_work.save
        format.html {redirect_to @home_work, notice: 'Задание успешно создано.'}
        format.json {render :show, status: :created, location: @home_work}
      else
        format.html {render :new}
        format.json {render json: @home_work.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /home_works/1
  # PATCH/PUT /home_works/1.json
  def update
    respond_to do |format|
      if @home_work.update(home_work_params)
        format.html {redirect_to @home_work, notice: 'Задание успешно обновлено.'}
        format.json {render :show, status: :ok, location: @home_work}
      else
        format.html {render :edit}
        format.json {render json: @home_work.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /home_works/1
  # DELETE /home_works/1.json
  def destroy
    @home_work.destroy
    respond_to do |format|
      format.html {redirect_to user_home_works_url(@user), notice: 'Задание успешно удалено.'}
      format.json {head :no_content}
    end
  end

  def group_select
    search = params[:search]
    page = params[:page].present? ? params[:page].to_i : 1
    groups = @user.teacher.student_groups
    if search.present?
      groups = groups.where('student_groups.name ILIKE ?', "%" + search + "%")
    end
    groups = groups.limit(11)
    groups = groups.offset(10*(page - 1))
    result = {
        "results": groups[0..9].map {|group| {id: group.id, text: group.name}},
        "pagination": {
            "more": (groups.count == 11)
        }
    }
    respond_to do |format|
      format.json {
        render json: result
      }
    end
  end

  def hw_student_select
    search = params[:search]
    page = params[:page].present? ? params[:page].to_i : 1
    students = StudentGroup.find(params[:group_id]).students
    if search.present?
      students = students.joins(:user).where('users.name ILIKE ?', "%" + search + "%")
    end
    students = students.limit(11)
    students = students.offset(10*(page - 1))
    result = {
        "results": students[0..9].map {|student| {id: student.id, text: student.name}},
        "pagination": {
            "more": (students.count == 11)
        }
    }
    respond_to do |format|
      format.json {
        render json: result
      }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_home_work
    @home_work = HomeWork.find(params[:id])
  end

  def set_user
    @user = current_user || User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def home_work_params
    params.require(:home_work).permit(:group_or_student, :check_point, :comment, :teacher_id, :student_group_id,
                                      student_ids: [], questionnaire_ids: [], word_list_ids: [])
  end
end
