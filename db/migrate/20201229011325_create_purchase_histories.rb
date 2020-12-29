class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.references :user,foreign_key: true
      t.references :item,foreign_key: true
      t.timestamps
    end
  end
end
