class AddDeletedInComments < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :comments, :deleted, :boolean, default: false
  	  	remove_column :comments, :author_name
	end
end
