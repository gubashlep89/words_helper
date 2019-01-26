class UsersController < ApplicationController
  before_action :set_user, only: [:create_teacher, :create_student]

  def create_teacher
    if @user.teacher
      redirect_back(fallback_location: edit_user_registration_path,
                    :flash => { :error => 'Вы уже зарегестрированы как преподаватель.' })
    else
      teacher = @user.build_teacher
      if teacher.save
        redirect_to info_path, notice: 'Вы зарегестрированы как преподаватель.'
      else
        redirect_back(fallback_location: edit_user_registration_path,
                      :flash => { :error => 'Не удалось выбрать роль.' })
      end
    end
  end

  def create_student
    if @user.student
      redirect_back(fallback_location: edit_user_registration_path,
                    :flash => { :error => 'Вы уже зарегестрированы как студент.' })
    else
      student = @user.build_student
      if student.save
        redirect_to info_path, notice: 'Вы зарегестрированы как студент.'
      else
        redirect_back(fallback_location: edit_user_registration_path,
                      :flash => { :error => 'Не удалось выбрать роль.' })
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
