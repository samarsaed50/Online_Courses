class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :content
      t.string :attachment

      t.timestamps
    end
  end
end
