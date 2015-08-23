module RedmineStats
  class IssueHandling
    class HorizontalPoint
      def self.call(date)
        [date.year, date.strftime('%m')].join('-')
      end
    end
  end
end
