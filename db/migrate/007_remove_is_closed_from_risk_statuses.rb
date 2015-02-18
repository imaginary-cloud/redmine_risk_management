class RemoveIsClosedFromRiskStatuses < ActiveRecord::Migration

  def change
    remove_column :risk_statuses, :is_closed
    remove_index :risk_statuses, :is_closed
  end

end