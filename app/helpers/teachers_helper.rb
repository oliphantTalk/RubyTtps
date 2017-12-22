module TeachersHelper

  def teacher_courses_string
    cursos = ""
    @teacher.courses.each do |c|

      cursos << c.subject.name + ', ' + c.year.to_s + ";\n"

    end
    cursos
  end


end
