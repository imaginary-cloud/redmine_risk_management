class AddDefaultRiskStatuses < ActiveRecord::Migration
  def change
    risk_statuses = {
      'Identified' => { is_default: true, color: '16776960' },
      'Monitored'  => { color: '16756490' },
      'Occurred'   => { color: '16711680' },
      'Dismissed'  => { color: '32768', status_type: 'closed' }
    }

    risk_statuses.each do |key, value|
      RiskStatus.create({ name: key }.merge(value))
    end
  end
end