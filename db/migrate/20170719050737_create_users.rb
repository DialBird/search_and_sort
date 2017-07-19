class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :corporation, foreign_key: true
      t.string :name
      t.integer :age
      t.integer :sex_id

      t.timestamps
    end
  end
end
