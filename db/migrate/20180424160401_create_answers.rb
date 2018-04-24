class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.column :question_id, :integer
      t.column :answer_body, :string
    end
  end
end
