require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'associations' do
    it { should belong_to(:restaurant) }
    it { should have_many(:menu_dish) }
    it { should have_many(:dish).through(:menu_dish) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
  end
end
