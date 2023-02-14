class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.date :memo_date
      t.string :memo_name
      t.string :string
      t.text :memo_body

      t.timestamps
    end
  end
end
