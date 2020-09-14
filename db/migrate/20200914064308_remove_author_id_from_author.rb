class RemoveAuthorIdFromAuthor < ActiveRecord::Migration[6.0]
  def change
    remove_column :authors, :author_id, :integer
  end
end
