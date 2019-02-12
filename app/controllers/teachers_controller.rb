class TeachersController < ApplicationController
  before_action :store_location
  before_action :authenticate_user!, only: [:connect_from_link, :join_teacher_group]
  before_action :set_group, only: [:connect_from_link, :join_teacher_group]

  def connect_from_link
    @teacher = @group.teacher
  end

  def join_teacher_group
    case params[:btn_type]
    when 'confirm_from_student'
      current_user.student.update(student_group_id: @group.id)
      redirect_to info_path, notice: "Вы зачислены в группу к #{@group.teacher&.name}"
    when 'confirm_from_change_teacher'
      current_user.student.update(student_group_id: @group.id)
      redirect_to info_path, notice: "Преподователь изменен, вы зачислены в группу к #{@group.teacher&.name}"
    when 'confirm_from_user'
      student = @user.build_student
      if student.save
        student.update(student_group_id: @group.id)
        redirect_to info_path, notice: "Вы зарегестрированы как студент и зачислены в группу к #{@group.teacher&.name}."
      else
        redirect_back(fallback_location: edit_user_registration_path,
                      :flash => { :error => 'Не удалось выбрать роль.' })
      end
    end
  end

  def student_select
    search = params[:search]
    page = params[:page].present? ? params[:page].to_i : 1
    free_students = Student.free
    if (student_group_id = params[:student_group_id]).present?
      free_students = free_students.or(StudentGroup.find(student_group_id).students)
    end
    if search.present?
      free_students = free_students.joins(:user).where('users.name ILIKE ?', "%" + search + "%")
    end
    free_students = free_students.limit(11)
    free_students = free_students.offset(10*(page - 1))
    result = {
        "results": free_students[0..9].map {|free_student| {id: free_student.id, text: free_student.name}},
        "pagination": {
            "more": (free_students.count == 11)
        }
    }
    respond_to do |format|
      format.json {
        render json: result
      }
    end
  end

  private

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def set_group
    @group = StudentGroup.find(params[:group_id])
  end

end
