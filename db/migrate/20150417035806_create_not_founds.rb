class CreateNotFounds < ActiveRecord::Migration
  def change
    create_table :not_founds, id: :uuid do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
