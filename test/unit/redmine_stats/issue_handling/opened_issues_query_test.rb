require File.expand_path('../../../../test_helper', __FILE__)

module RedmineStats
  class IssueHandling::OpenedIssuesQueryTest < ActiveSupport::TestCase

    plugin_fixtures :issues

    def setup
      @date_range = DateRange.new('2015-01-01', '2015-01-31')
    end

    def test_finding_opened_issues
      result = OpenedIssuesQuery.call(@date_range)
      assert_equal result['2015-01'].count, 3
    end

  end
end
