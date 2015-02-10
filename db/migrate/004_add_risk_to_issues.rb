class AddRiskToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :risk_id, :integer
    add_index :issues, :risk_id
  end
end
