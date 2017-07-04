require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      user_name: "yungthug4",
      password: "password")
  end

  describe 'validations' do
    before { User.create(user_name: "lilboosie5", password: "password") }
    it { should validate_presence_of (:user_name) }
    it { should validate_presence_of (:password_digest) }
    it { should validate_uniqueness_of (:user_name) }
    it { should validate_length_of(:password).is_at_least(6) }

    it 'creates a password digest when a password is given' do
      expect(user.password_digest).to_not be_nil
    end

    it 'creates a session token before validation' do
      user.valid?
      expect(user.session_token).to_not be_nil
    end
  end

  describe 'reset_session_token!' do
    it 'should reset the session token' do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_token)
    end
  end

  describe 'valid_password?' do
    context 'When password matches' do
      it 'should return true' do
        expect(user.valid_password?("password")).to eq(true)
      end
    end

    context "When password doesn't match"
      it 'should return false' do
        expect(user.valid_password?("passw0rd")).to eq(false)
      end
    end

  describe 'User.find_by_credentials' do
    before { user.save! }
    context 'When user does exist' do
      it 'should return the user' do
        expect(User.find_by_credentials("yungthug4", "password")).to eq(user)
      end
    end

    context "When user doens't exist" do
      it 'should return nil' do
        expect(User.find_by_credentials('yungthug4', "password420")).to eq(nil)
      end
    end
  end
end
