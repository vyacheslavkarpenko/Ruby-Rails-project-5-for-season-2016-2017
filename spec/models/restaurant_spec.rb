require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'associations' do
    it { should have_one(:menu) }
  end
end
