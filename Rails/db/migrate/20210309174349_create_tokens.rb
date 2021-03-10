class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.text :room
      t.text :battleHot
      t.text :battleCool

      t.timestamps
    end
  end
end
