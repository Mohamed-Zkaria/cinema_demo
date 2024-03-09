class ChangeYearTypeToString < ActiveRecord::Migration[7.1]
  def change
    change_column(:movies, :year, :string)
  end
end
