module EvaluationsHelper

  def evaluation_info(evaluation)
    evaluation.course.subject.name + ' ' + evaluation.title + ' ' + evaluation.date.to_s
  end

  def inscriptos(evaluation)
    evaluation.evaluation_students.count
  end

  def ausentes(evaluation)
    evaluation.evaluation_students.where(:score => 0).count.to_s
    #EvaluationStudent.where(:evaluation_id => evaluation.id, :score => 'Ausente').count
  end

  def aprobados(evaluation)
    evaluation.evaluation_students.where("score >= #{evaluation.min_score}").count.to_s
    #EvaluationStudent.where("evaluation_id = #{evaluation.id} and score >= #{evaluation.min_score} and score <> 'Ausente'").count.to_s
  end

  def desaprobados(evaluation)
    evaluation.evaluation_students.where("score <= #{evaluation.min_score}").count.to_s
    #EvaluationStudent.where("evaluation_id = #{evaluation.id} and score <= #{evaluation.min_score} and score <> 'Ausente'").count.to_s
  end

  def porcentaje_aprobados(evaluation)
    ((aprobados(evaluation).to_f/inscriptos(evaluation).to_f)*100).to_s
  end

end
