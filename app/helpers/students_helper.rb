module StudentsHelper

  def already_inscripted(evaluation_id, student_id)
    EvaluationStudent.where(evaluation_id: evaluation_id, student_id: student_id).empty?
  end

end
