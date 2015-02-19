class AddDefaultRiskStatusToRisks < ActiveRecord::Migration

  def change
    default_risk_status = RiskStatus.default
    Risk.where(risk_status_id: nil).update_all(risk_status_id: default_risk_status.id)
  end

end