module CoursesHelper



  def course_name_by_id(course_id)
    Course.where(:id => course_id).first.subject.name
  end

end
