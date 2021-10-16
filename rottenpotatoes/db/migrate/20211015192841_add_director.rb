# Generate in cli 'rails generate active_record:migration AddDirector'

class AddDirector < ActiveRecord::Migration
  def change
    # Add new director column to movies table
    add_column :movies, :director, :string
  end
end
