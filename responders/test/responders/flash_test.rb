require 'test_helper'

class FlashTest < ActionController::TestCase
  tests UserController

  test 'sets notice message on successful creation' do
    post :create, user: { name: 'Leo Gallucci' }
    assert_equal 'User was successfully created.', flash[:notice]
  end

  test 'sets notice message on successful update' do
    user = User.create!(name: 'Leo Gallucci')
    put :update, id: user.id, user: { name: 'Another Leo Gallucci' }
    assert_equal 'User was successfully updated.', flash[:notice]
  end

  test 'sets notice message on successful destroy' do
    user = User.create!(name: 'Leo Gallucci')
    delete :destroy, id: user.id
    assert_equal 'User was successfully destroyed.', flash[:notice]
  end
end
