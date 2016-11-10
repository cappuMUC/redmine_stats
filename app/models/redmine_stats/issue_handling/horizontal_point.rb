# This class provides a standard key for grouping
# issues in reports
module RedmineStats
  class IssueHandling
    class HorizontalPoint
      def self.call(date)
        [date.year, date.strftime('%m')].join('-')
      end
    end
  end
end
