module RedmineStats
  class IssueHandling
    class Cumulative

      TREND_PRECISION = 3

      attr_reader :opened_issues, :closed_issues, :h_axis

      def initialize(opened_issues, closed_issues, h_axis)
        @opened_issues = opened_issues
        @closed_issues = closed_issues
        @h_axis        = h_axis
      end

      # api
      def call
        [].tap do |output|
          cumulated_opened_issues.each_with_index do |opened_issue_count, index|
            closed_issue_count = cumulated_closed_issues[index]

            if closed_issue_count > 0
              output << (opened_issue_count / closed_issue_count.to_f).round(TREND_PRECISION)
            else
              output << opened_issue_count
            end
          end
        end
      end

      private

      def cumulated_opened_issues
        @opened_issues_array ||= cumulate(opened_issues)
      end

      def cumulated_closed_issues
        @closed_issues_array ||= cumulate(closed_issues)
      end

      def cumulate(issues)
        [].tap do |output|
          h_axis.each_with_index do |point, index|
            if index == 0
              output.push vertical_value(issues, point)
            else
              output.push((vertical_value(issues, point)) + output[index - 1])
            end
          end
        end
      end

      def vertical_value(issues, point)
        issues[point] ? issues[point].count : 0
      end
    end
  end
end
