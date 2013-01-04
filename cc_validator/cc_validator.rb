#!/usr/bin/env ruby

class CreditCard

  def initialize(cc_number, cc_type)
    @cc_number = cc_number.gsub(/\s/, '')
    @cc_type = cc_type.downcase
  end

  def valid?
    valid_pattern? and valid_sum?
  end

  protected

  def valid_pattern?
    case @cc_type
    when "amex"
      @cc_number =~ /^3(4|7)\d{13}$/
    when "discover"
      @cc_number =~ /^6011\d{12}$/
    when "mastercard"
      @cc_number =~ /^5[1-5]\d{14}$/
    when "visa"
      @cc_number =~ /^4\d{12}(\d{3})?$/
    else
      raise "Invalid credit card type: #{@cc_type}"
    end
  end

  def valid_sum?
    str = ""
    @cc_number.reverse.split(//).each_with_index do |n, i|
      if i % 2 == 0
        str << n.to_s
      else
        str << (n.to_i * 2).to_s
      end
    end

    sum = str.split(//).inject(0) { |sum, n| sum + n.to_i }
    (sum % 10 == 0)
  end

end

cc = CreditCard.new(ARGV[0], ARGV[1])

if cc.valid?
  puts "Valid credit card"
else
  puts "Invalid credit card"
end


# sample input: ./cc_validator.rb "4408 0412 3456 7893" visa