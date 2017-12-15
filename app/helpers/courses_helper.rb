module CoursesHelper

  def courses_order_by_name
     #Subject.order(:name).joins(:courses)
    Course.joins(:subject).select("courses.*, subjects.*, courses.year as 'anio', subjects.year as plan").order("subjects.name")

  end



end
