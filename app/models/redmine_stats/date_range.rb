module RedmineStats
  class DateRange
    include Enumerable

    class UnparsableDate < Exception; end

    def initialize(start_date, end_date)
      @start_date = parse(start_date)
      @end_date   = parse(end_date)
    end

    def each
      (start_date .. end_date).each do |date|
        yield date
      end
    end

    def last
      to_a.last
    end

    private

    attr_reader :start_date
    attr_reader :end_date

    def parse(date)
      if date.is_a?(String)
        Date.parse(date)
      else
        date
      end
    rescue
      raise UnparsableDate.new("Unable to parse #{date}. #{date.class}")
    end

  end
end
