class Risk < ActiveRecord::Base
  unloadable

  RATIONALES = ['Monitor', 'Plan Mitigation', 'Mitigate']

  belongs_to :project
  belongs_to :user

  validates_presence_of :title, :description, :action
  validates_numericality_of :criticality, allow_nil: true
  validates_numericality_of :probability, :impact, greater_than: 0, less_than: 5
  validates_inclusion_of :rationale, in: RATIONALES, allow_nil: true

  before_save :set_criticality_rationale


private

  def set_criticality_rationale
    self.criticality = self.probability * self.impact
    self.rationale =
      case self.criticality
      when 1..4 then RATIONALES.first
      when 5..8 then RATIONALES.second
      else RATIONALES.third
      end
  end

end
