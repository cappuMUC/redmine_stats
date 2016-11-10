# This class provides the data required to plot a graph.
#
#   Initializer accepts:
#     - date_range : RedmineStats::DateRange
#     - strategy   : RedmineStats::IssueHandling::Cumulative
#
#   Strategy is used to calculate a trend. And because there
#   are many ways of doing this, use the Dependency Injection
#   so that it can be easily replaced in the future

module RedmineStats
  class IssueHandling 

    def initialize(date_range, strategy)
      @date_range = date_range
      @strategy   = strategy
    end

    def horizontal_axis
      @horizontal_axis ||= date_range.map do |date|
        HorizontalPoint.call(date)
      end.uniq
    end

    def trend
      strategy.new(opened_issues, closed_issues, horizontal_axis).call
    end

    private

    attr_reader :date_range, :strategy

    def opened_issues
      OpenedIssuesQuery.call(date_range)
    end

    def closed_issues
      ClosedIssuesQuery.call(date_range)
    end
  end
end
