class CreateArticleGametitles < ActiveRecord::Migration[5.2]
  def change
    create_table :article_gametitles do |t|
      t.references :article, null: false, foreign_key: true
      t.references :gametitle, null: false, foreign_key: true
      t.timestamps
    end
  end
end
