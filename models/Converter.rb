class Converter

  def self.gbp(amount)
    amount_string = amount.to_s
    pence = amount_string[-2, 2]
    pounds = amount_string[0..-3]
    gbp = "£#{pounds}.#{pence}"
    return gbp
  end

  def self.format_date(date)
    year = date[0..3]
    month = date[5..6]
    day = date[8..9]
    return "#{day}/#{month}/#{year}"
  end

end
