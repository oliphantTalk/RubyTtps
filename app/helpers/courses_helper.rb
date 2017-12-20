module CoursesHelper

  def courses_order_by_name
     #Subject.order(:name).joins(:courses)
    Course.joins(:subject).select("courses.*, subjects.*, courses.year as 'anio', subjects.year as plan").order("subjects.name")
  end

  def course_name_by_id(course_id)
    Course.where(:id => course_id).first.subject.name
  end

end
