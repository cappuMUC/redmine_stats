require File.expand_path('../../../../test_helper', __FILE__)

module RedmineStats
  class IssueHandling::HorizontalPointTest < ActiveSupport::TestCase

    def test_horizontal_point
      date  = Date.today
      point = IssueHandling::HorizontalPoint.call(date) 
      assert_equal date.strftime('%Y-%m'), point
    end

  end
end
