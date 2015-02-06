class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.integer :number
      t.string :title
      t.text :description
      t.integer :probability
      t.integer :impact
      t.integer :criticality
      t.string :rationale
      t.text :action
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end

    add_index :risks, :project_id
    add_index :risks, :user_id
  end
end
