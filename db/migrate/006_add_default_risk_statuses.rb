class AddDefaultRiskStatuses < ActiveRecord::Migration
  def change
    risk_statuses = {
      'Identified' => { is_default: true, color: '3373751' },
      'Monitored'  => { color: '15773006' },
      'Occurred'   => { color: '14242639' },
      'Dismissed'  => { color: '6076508', status_type: 'closed' }
    }

    risk_statuses.each do |key, value|
      RiskStatus.create({ name: key }.merge(value))
    end
  end
end