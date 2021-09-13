# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @user1 = User.new(email: 'user1@example.com')
    @report1 = Report.new(user: @user1, title: 'report1_title', content: 'report1_content')
  end

  test 'report editable' do
    user2 = User.new(email: 'user2@example.com')
    assert @report1.editable?(@user1)
    assert_not @report1.editable?(user2)
  end

  test 'created_on check' do
    @report1.created_at = Date.new(2021, 9, 11)
    travel_to Date.new(2021, 9, 11) do
      today = Time.zone.today
      assert_equal today, @report1.created_on
    end
  end
end
