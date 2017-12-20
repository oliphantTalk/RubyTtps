module EvaluationsHelper

  def evaluation_info(evaluation)
    evaluation.course.subject.name + ' ' + evaluation.title + ' ' + evaluation.date.to_s
  end



end
