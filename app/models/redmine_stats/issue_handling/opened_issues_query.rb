module RedmineStats
  class IssueHandling
    class OpenedIssuesQuery
      def self.call(date_range)
        Issue.where('created_on <= ?', date_range.last)
        .group_by { |i| HorizontalPoint.call(i.created_on) }
      end
    end
  end
end
