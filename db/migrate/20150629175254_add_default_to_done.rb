class AddDefaultToDone < ActiveRecord::Migration
  def change
    remove_column(:tasks, :done, :boolean)
    add_column(:tasks, :done, :boolean, :default => false)
  end
end
