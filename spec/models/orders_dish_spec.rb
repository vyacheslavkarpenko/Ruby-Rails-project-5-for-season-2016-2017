require 'rails_helper'

RSpec.describe OrdersDish, type: :model do
  describe 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:dish) }
  end
end
