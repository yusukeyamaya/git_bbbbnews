class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      
      t.text :title
      t.text :team
      t.text :link
      t.text :date
      
      t.timestamps
    end
  end
end
