module StudentsHelper

  def not_inscripted(evaluation_id, student_id)
    EvaluationStudent.where(evaluation_id: evaluation_id, student_id: student_id).empty?
  end

  def evaluacion(evaluation, student)
    EvaluationStudent.where(:evaluation_id => evaluation.id, student_id: student.id).first
  end

end
