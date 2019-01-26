class TeachersController < ApplicationController

  def student_select
    search = params[:search]
    page = params[:page].present? ? params[:page].to_i : 1
    free_students = Student.free
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
end
