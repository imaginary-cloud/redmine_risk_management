class CreateRiskStatuses < ActiveRecord::Migration
  def change
    create_table :risk_statuses do |t|
      t.string  :name
      t.integer :position
      t.boolean :is_default,  default: false
      t.integer :color,       default: 11184810
      t.string  :status_type, default: 'open'
    end

    add_column :risks, :risk_status_id, :integer
    add_index :risks, :risk_status_id
  end
end