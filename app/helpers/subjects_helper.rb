module SubjectsHelper

  def subjects_for_courses
    names = []
    Subject.all.each do |s|
      names << s.name
    end
    names
  end

end
