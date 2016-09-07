# The AddControlsToRisk migration will add a controls text item to the risk
# model allowing the risk creator to spesify how to prevent the risk
class AddControlsToRisks < ActiveRecord::Migration
  def change
    add_column :risks, :controls, :text
  end
end
