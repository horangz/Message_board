class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :content
			t.string :email
			t.string :city
			t.string :address
			t.integer :category_id

      t.timestamps
    end
		add_index :ads, :category_id
  end
end
