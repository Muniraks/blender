class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :username
      t.string :feedback
      t.string :rate

      t.timestamps
    end
  end
end
