json.extract! student_group, :id, :teacher_id, :name, :description, :created_at, :updated_at
json.url student_group_url(student_group, format: :json)
