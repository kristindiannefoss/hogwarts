class AddCurrentScoreToStudent < ActiveRecord::Migration
  def change
    add_column :students, :current_score, :integer
  end
end
