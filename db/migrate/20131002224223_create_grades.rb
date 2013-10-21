class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.belongs_to :school 
      t.string :name
      t.timestamps
    end
  end
end
