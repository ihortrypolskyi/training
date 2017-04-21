require 'rails_helper'

RSpec.describe User, type: :model do
 before{@user=User.new(name: 'Example user', email: 'example@gmail.com', password: 'password',
                       password_confirmation: 'password' )}
 subject{@user}
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should be_valid}
  it {should respond_to(:authenticate)}

 describe 'if name is not present' do
   before {@user.name=''}
   it {should_not be_valid}
 end

 describe 'if email is not present' do
   before {@user.email = ''}
   it {should_not be_valid}
 end

  describe 'if name is too long' do
    before {@user.name = 'a' * 51}
    it {should_not be_valid}
  end

  describe 'if email format is not valid' do
    it 'should not be valid' do
      wrong_email = %W[user@foo,com user_at_foo.org
example.user@foo.foo@bar_baz.com foo@bar+baz.com foo@baz..com]
      wrong_email.each do |x|
        @user.email = x
        expect(@user).not_to be_valid
      end
    end
  end

  describe 'if email format is valid' do
    it 'should be valid' do
      right_email = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      right_email.each do |x|
        @user.email = x
        expect(@user).to be_valid
      end
    end
  end

  describe 'when email is already taken' do
    before do
      x = @user.dup
      x.email = @user.email.upcase
      x.save
    end
    it {should_not be_valid}
  end

  describe 'when password is not present' do
    # before do
    #   @user=User.new(name: 'Example user', email: 'example@gmail.com', password: '',
    #                  password_confirmation: '' )
    # end
    before { @user.password = @user.password_confirmation = '' }
    it {should_not be_valid}
  end

  describe 'when password does not match confirmation' do
    before { @user.password_confirmation = 'wrong' }
    it {should_not be_valid}
  end

  describe 'when password is too short' do
    before {@user.password = @user.password_confirmation = 'a' * 5}
    it {should_not be_valid}
  end

  describe 'return value of authenticate method' do
    before {@user.save}
    let(:found_user) {User.find_by(email: @user.email)}

    describe 'with valid password' do
      it {should eq found_user.authenticate(@user.password)}
    end

    describe 'with invalid password' do
      let(:invalid_pass_user) {found_user.authenticate('invalid')}
      it {should_not eq invalid_pass_user}
      it { expect(invalid_pass_user).to be false }
    end

    describe 'email in mixed casees' do
      let(:mixed_case_email) {'EXamPle@GmAIl.coM'}
      it 'should be saved downcase' do
        @user.email = mixed_case_email
        @user.save
        expect(@user.reload.email).to eq mixed_case_email.downcase
      end
    end
  end
end