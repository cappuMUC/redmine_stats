# Query object returning closed issues
module RedmineStats
  class IssueHandling
    class ClosedIssuesQuery
      def self.call(date_range)
        Issue.where('closed_on <= ?', date_range.last)
        .group_by { |i| HorizontalPoint.call(i.closed_on) }
      end
    end
  end
end
