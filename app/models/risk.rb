class Risk < ActiveRecord::Base
  unloadable

  validates_presence_of :title, :description, :action
  validates_numericality_of :criticality
  validates_numericality_of :probability, :impact, greater_than: 0, less_than: 5
  validates_inclusion_of :rationale, in: ['Monitor', 'Plan Mitigation', 'Mitigate']

  after_save :calculate_criticality


private

  def calculate_criticality
    self.criticality = self.probability * self.impact
  end

end
