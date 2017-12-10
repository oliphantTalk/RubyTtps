module TeachersHelper

  def teacher_courses_string
    cursos = ""
    @teacher.courses.each do |c|

      cursos << c.subject.name + ', ' + c.year.to_s + ";\n"
      #cursos << link_to("#{c.subject.name}, #{c.year}; \n", course_path(c))

    end
    cursos
  end


end
