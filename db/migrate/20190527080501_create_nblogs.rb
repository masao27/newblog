class CreateNblogs < ActiveRecord::Migration[5.2]
  def change
    create_table :nblogs do |t|
      t.text  :text
      t.timestamps null: true
      t.integer :user_id
    end
  end
end
