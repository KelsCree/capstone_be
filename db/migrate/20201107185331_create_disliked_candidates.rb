class CreateDislikedCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :disliked_candidates do |t|
      t.string :cand_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
