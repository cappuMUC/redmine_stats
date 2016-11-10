require File.expand_path('../../../../test_helper', __FILE__)

module RedmineStats
  class IssueHandling::CumulativeTest < ActiveSupport::TestCase

    plugin_fixtures :issues

    def setup
      opened = { 
        '2015-01' => [
          Issue.find(1),
          Issue.find(2),
          Issue.find(3)
        ],
        '2015-02' => [
          Issue.find(4),
          Issue.find(5)
        ]
      }

      closed = { 
        '2015-01' => [
          Issue.find(3)
        ],
        '2015-02' => [
          Issue.find(4),
          Issue.find(5)
        ]
      }

      @strategy = Cumulative.new(opened, closed, ['2015-01', '2015-02'])
    end

    def test_cumulative_trend_calculation
      assert_equal @strategy.call, [3, 1.667]
    end

  end
end
