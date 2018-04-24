class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.column :user_id, :integer
      t.column :question_title, :string
      t.column :question_body, :string
    end
  end
end
