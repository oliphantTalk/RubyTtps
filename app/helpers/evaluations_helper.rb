module EvaluationsHelper

  def evaluation_info(evaluation)
    evaluation.course.subject.name + ' ' + evaluation.title + ' ' + evaluation.date.to_s
  end

  def ausentes(evaluation)
    EvaluationStudent.where(:evaluation_id => evaluation.id, :score => 'Ausente').count
  end

  def aprobados(evaluation)
    EvaluationStudent.where(:evaluation_id => evaluation.id, :score => 'Ausente').count
  end

  def desaprobados(evaluation)
    EvaluationStudent.where(:evaluation_id => evaluation.id, :score => 'Ausente').count
  end

end
