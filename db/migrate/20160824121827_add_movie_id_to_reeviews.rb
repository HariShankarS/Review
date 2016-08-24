class AddMovieIdToReeviews < ActiveRecord::Migration
  def change
    add_column :reeviews, :movie_id, :integer
  end
end
