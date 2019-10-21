require 'csv'
require 'nokogiri'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @importable = []
    @csv_file_path = csv_file_path
    csv_load
  end

  def all
    @recipes
  end

  def importables
    @importable
  end

  def add_recipe(recipe)
    # => add a line in the csv file
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    # =>  remove a line from the csv file
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def find(recipe_index)
    @recipes[recipe_index]
  end

  private

  def csv_load
    CSV.foreach(@csv_file_path) do |row|
      # Here, row is an array of columns
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end

  def save_csv
    # csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.level]
      end
    end
  end
end
