# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user1 = User.create!(email: 'user1@example.com', password: 'password')
    @report1 = Report.create!(user_id: @user1.id, title: 'report1_title', content: 'report1_content')
  end

  test 'report editable' do
    user2 = User.create!(email: 'user2@example.com', password: 'password')
    assert @report1.editable?(@user1)
    assert_not @report1.editable?(user2)
  end

  test 'created_on check' do
    today = Date.today
    assert_equal today, @report1.created_on
  end
end
