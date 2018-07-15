require 'rails_helper'

RSpec.describe MenuDish, type: :model do
  describe 'associations' do
    it { should belong_to(:menu) }
    it { should belong_to(:dish) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:dish_id) }
  end
end
