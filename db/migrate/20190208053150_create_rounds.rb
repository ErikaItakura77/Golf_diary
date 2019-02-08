class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.date :day
      t.string :course
      t.string :weather
      t.string :wind
      t.integer :green
      t.string :tee
      t.integer :score_first_nine
      t.integer :score_back_nine
      t.integer :score_add
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :member4
      t.string :picture
      t.string :video

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
