class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :content
			t.integer :category_id

      t.timestamps
    end
		add_index :ads, :category_id
  end
end
