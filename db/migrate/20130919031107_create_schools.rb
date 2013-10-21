class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.belongs_to :user
      t.string :schname
      t.string :address
      t.string :phone
      t.timestamps
    end
  end
end
