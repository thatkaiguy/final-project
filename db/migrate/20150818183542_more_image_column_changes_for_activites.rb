class MoreImageColumnChangesForActivites < ActiveRecord::Migration
  def change
    remove_column :activities, :img_url_small_size
  end
end
