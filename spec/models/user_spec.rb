require 'rails_helper'
RSpec.describe User, type: :model do
  context 'with Devise modules' do
    it 'is expected to be database authenticatable' do
      expect(User.new).to respond_to(:database_authenticatable?)
    end

    it 'is expected to be registerable' do
      expect(User.new).to respond_to(:registerable?)
    end

    it 'is expected to be recoverable' do
      expect(User.new).to respond_to(:recoverable?)
    end

    it 'is expected to be rememberable' do
      expect(User.new).to respond_to(:rememberable?)
    end

    it 'is expected to be validatable' do
      expect(User.new).to respond_to(:validatable?)
    end
  end

  context 'when created' do
    let(:user) { User.create(email: 'test@example.com', password: 'password') }

    it 'is valid' do
      expect(user).to be_valid
    end

    it 'has a default role of user' do
      expect(user.role).to eq('user')
    end
  end

  context 'with admin role' do
    let(:admin) { User.create(email: 'admin@example.com', password: 'admin_password', role: 'admin') }

    it 'has an admin role' do
      expect(admin.role).to eq('admin')
    end
  end
end
