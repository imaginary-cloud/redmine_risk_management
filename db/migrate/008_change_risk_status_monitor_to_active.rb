class ChangeRiskStatusMonitorToActive < ActiveRecord::Migration

  def change
    risk_status = RiskStatus.find_by_name 'Monitored'
    if risk_status
      risk_status.update_attributes(name: 'Active')
    else
      RiskStatus.create(name: 'Active', color: '15773006')
    end
  end

end