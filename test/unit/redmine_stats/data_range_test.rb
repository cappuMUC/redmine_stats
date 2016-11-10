require File.expand_path('../../../test_helper', __FILE__)

module RedmineStats
  class DataRangeTest < ActiveSupport::TestCase

    def test_string_parsing
      first  = '2015-01-01'
      second = '2015-01-02'

      range = DateRange.new(first, second)

      start_date = Date.parse(first)
      end_date   = Date.parse(second)

      assert_equal range.to_a, [start_date, end_date]
    end

    def test_date_parsing
      first  = '2015-01-01'
      second = '2015-01-02'

      start_date = Date.parse(first)
      end_date   = Date.parse(second)

      range = DateRange.new(start_date, end_date)

      assert_equal range.to_a, [start_date, end_date]
    end

    def test_unparsable_date_handling
      first  = '2015-01-01'
      second = 'not-a-date'

      assert_raise DateRange::UnparsableDate do
        range = DateRange.new(first, second)
      end
    end


  end
end

