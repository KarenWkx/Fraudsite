class AddAreasonToIcos < ActiveRecord::Migration[5.1]
  def change
    add_column :icos, :areason, :text
  end
end
