class CreateIcos < ActiveRecord::Migration[5.1]
  def change
    create_table :icos do |t|
      t.integer :id
      t.string :email
      t.string :ico_name
      t.string :symbol
      t.string :website
      t.string :whitepaper
      t.string :country
      t.text :description
      t.text :reason
      t.date :release_date
      t.string :status
      t.decimal :ranking
      t.datetime :date_submitted
      t.datetime :date_approved
      t.string :admin_approved

      t.timestamps
    end
  end
end
