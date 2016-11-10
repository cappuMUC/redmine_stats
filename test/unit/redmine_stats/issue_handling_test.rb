require File.expand_path('../../../test_helper', __FILE__)

module RedmineStats
  class IssueHandlingTest < ActiveSupport::TestCase

    plugin_fixtures :issues

    def setup
      date_range  = DateRange.new('2015-01-01', '2015-02-28')

      @issue_handling = RedmineStats::IssueHandling.new(date_range, IssueHandling::Cumulative)
    end

    def test_trend 
      assert_equal @issue_handling.trend, [3.0, 1.667]
    end

    def test_axis
      assert_equal @issue_handling.horizontal_axis, ['2015-01', '2015-02']
    end

  end
end
