class DateRange
  attr_reader :start_date, :end_date

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def overlap?(other_date)
    return true if other_date.start_date.between?(@start_date, @end_date)
    return true if other_date.end_date.between?(@start_date, @end_date)
    false
  end
end
