require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:restaurant) }
    it { should belong_to(:user) }
    it { should have_many(:orders_dishes) }
    it { should have_many(:dishes).through(:orders_dishes) }
  end
end
