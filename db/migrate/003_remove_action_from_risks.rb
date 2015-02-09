class RemoveActionFromRisks < ActiveRecord::Migration
  def self.up
    remove_column :risks, :action
  end

  def self.down
    add_column :risks, :action, :text
  end
end
