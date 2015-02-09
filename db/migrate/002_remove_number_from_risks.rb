class RemoveNumberFromRisks < ActiveRecord::Migration
  def self.up
    remove_column :risks, :number
  end

  def self.down
    add_column :risks, :number, :integer
  end
end
