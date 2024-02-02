require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RecipesHelper. For example:
#
# describe RecipesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

# spec/support/controller_helpers.rb

module ControllerHelpers
  def create_user
    User.create(username: 'test_user', email: 'test@example.com', password: 'password')
  end

  def create_recipe(user)
    user.recipes.create(title: 'Test Recipe', description: 'Test Description')
  end
end

RSpec.configure do |config|
  config.include ControllerHelpers, type: :controller
end
