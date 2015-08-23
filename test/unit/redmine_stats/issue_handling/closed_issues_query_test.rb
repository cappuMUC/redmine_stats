require File.expand_path('../../../../test_helper', __FILE__)

module RedmineStats
  class IssueHandling::CloseIssuesQueryTest < ActiveSupport::TestCase

    plugin_fixtures :issues

    def setup
      @date_range = DateRange.new('2015-02-01', '2015-02-28')
    end

    def test_finding_closed_issues
      result = ClosedIssuesQuery.call(@date_range)
      assert_equal result['2015-02'].count, 2
    end

  end
end
