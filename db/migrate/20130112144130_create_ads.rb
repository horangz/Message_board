class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :content
      t.string :email
      t.string :city
      t.string :address
      t.string :img

      t.timestamps
    end
  end
end
