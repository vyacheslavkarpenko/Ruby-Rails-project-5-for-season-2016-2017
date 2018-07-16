require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'associations' do
    it { should have_many(:orders_dish) }
    it { should have_many(:order).through(:orders_dish) }
    it { should have_many(:menu_dish) }
    it { should have_one(:menu).through(:menu_dish) }
  end
end
