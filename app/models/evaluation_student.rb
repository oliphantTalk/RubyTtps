class EvaluationStudent < ApplicationRecord
  belongs_to :evaluation
  belongs_to :student

  after_update :update_status

   validates :status, inclusion: { in: ["Aprobado", "Desaprobado", "Por calificar", "Ausente", ""] }
 # validates :score, inclusion: { in: 0..10 }
   validates_inclusion_of :score, :in => 0..10



  def estado_examen
    nota_minima = self.evaluation.min_score.to_i
    nota = self.score.to_i
    if nota == 0
      "Ausente"
    elsif (0...nota_minima).include?(nota)
      "Desaprobado"
    elsif (nota_minima..10).include?(nota)
      "Aprobado"
    else
      "Por calificar"
    end

  end

  private
  def update_status
    update_attribute(:status, self.estado_examen)
  end


end
