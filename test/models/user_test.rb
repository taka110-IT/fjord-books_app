# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @me = User.create!(email: 'me@example.com', password: 'password')
    @she = User.create!(email: 'she@example.com', password: 'password')
  end

  test 'name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end

  test 'user follow' do
    assert_not @she.followers.include?(@me)
    @me.follow(@she)
    assert @she.followers.include?(@me)
  end

  test 'user unfollow' do
    @me.follow(@she)
    assert @she.followers.include?(@me)
    @me.unfollow(@she)
    assert_not @she.followers.include?(@me)
  end

  test 'following?' do
    @me.follow(@she)
    assert_equal @me.following?(@she), @me.followings.include?(@she)
  end

  test 'followed_by?' do
    @me.follow(@she)
    assert_equal @she.followed_by?(@me), @she.followers.include?(@me)
  end
end
