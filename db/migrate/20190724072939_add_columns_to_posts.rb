class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :question, :string
    add_column :posts, :answer_one, :string
    add_column :posts, :answer_two, :string
    add_column :posts, :answer_three, :string
  end
end
