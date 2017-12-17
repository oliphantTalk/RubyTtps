class EvaluationStudent < ApplicationRecord
  belongs_to :evaluation
  belongs_to :student
end
