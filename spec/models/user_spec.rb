require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'associations' do
    it { should have_many(:orders) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:phone).is_greater_than(6).allow_nil }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
  end

  describe '#set_auth_token' do
    let(:user) { build(:user) }
    let(:token) { user.auth_token = user.generate_auth_token }

    before do
      allow(user).to receive(:set_auth_token).and_return(token)  
    end

    it 'set auth_token' do
      expect(user.set_auth_token).to eq(token)
    end
  end

  describe '#generate_auth_token' do
    let(:auth_token) { SecureRandom.uuid.gsub(/\-/,'') }

    before do
      allow(subject).to receive(:generate_auth_token).and_return(auth_token)
    end

    it 'returns uuid from SecureRandom module' do
      expect(subject.generate_auth_token).to eq(auth_token)
    end
  end
end
