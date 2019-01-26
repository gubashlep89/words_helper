class StudentGroupsController < ApplicationController
  before_action :set_student_group, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher, only: [:index, :new, :create]

  # GET /student_groups
  # GET /student_groups.json
  def index
    @student_groups = @teacher.student_groups
  end

  # GET /student_groups/1
  # GET /student_groups/1.json
  def show
  end

  # GET /student_groups/new
  def new
    @student_group = @teacher.student_groups.build
  end

  # GET /student_groups/1/edit
  def edit
    @teacher = @student_group.teacher
  end

  # POST /student_groups
  # POST /student_groups.json
  def create
    @student_group = StudentGroup.new(student_group_params)
    @student_group.teacher = @teacher

    respond_to do |format|
      if @student_group.save
        format.html {redirect_to user_student_groups_path(@student_group.teacher),
                      notice: 'Группа студентов успешно создана.'}
        format.json { render :show, status: :created, location: @student_group }
      else
        format.html { render :new }
        format.json { render json: @student_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_groups/1
  # PATCH/PUT /student_groups/1.json
  def update
    respond_to do |format|
      if @student_group.update(student_group_params)
        format.html {redirect_to user_student_groups_path(@student_group.teacher),
                                 notice: 'Группа студентов успешно обновлена.'}
        format.json { render :show, status: :ok, location: @student_group }
      else
        format.html { render :edit }
        format.json { render json: @student_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_groups/1
  # DELETE /student_groups/1.json
  def destroy
    teacher = @student_group.teacher
    if teacher.student_groups.count <= 1
      redirect_back fallback_location: root_url, :flash => { :error => 'Нельзя удалить единственную группу' }
    else
      @student_group.destroy
      respond_to do |format|
        format.html { redirect_to user_student_groups_path(teacher), notice: 'Группа студентов успешно удалена.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_group
      @student_group = StudentGroup.find(params[:id])
    end

    def set_teacher
      @teacher = (User.find(params[:user_id]) || current_user).teacher
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_group_params
      params.require(:student_group).permit(:teacher_id, :name, :description, student_ids: [])
    end
end
