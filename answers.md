1. #3 - nil.to_i

2. 1

3. 

> 1
> 2
> 5

4.

1
1

5. #1 will raise a warning because of the string "false" and-ed with a boolean value, but it will result to true, #3 will always result to true

6. 
task1
completed

7.

#!/usr/bin/env ruby
# validate.rb

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


# sample input: ruby validate.rb "4408 0412 3456 7893" visa



8. The most efficient way would be to set up an OAuth provider and then assign both web applications as OAuth consumers:
a. Set up an authentication service: www.auth.com. We'll set this up as our oAuth provider. Create an authentication form to accept username and password.
b. Add before filters for www.app1.com and www2.app.com that would check if the user is logged in via cookies. Set them up as OAuth consumers. 
c. If the user is not logged in, the app will issue an OAuth authentication and redirect to the OAuth provider, where the user can enter their username/password, and when the authentication is valid, it will redirect back to the OAuth consumer with the necessary tokens.
d. If the user is already logged in on the OAuth provider, it will simply redirect back to the consumer with the tokens.
d. Once the authentication goes through at the OAuth provider level, the user gets redirected back to the consumer with the access tokens, and on the consumer level, these tokens can be used to request further information about the logged in user.
e. Store this information in the session cookies for the current app. The before filter for both apps should be checking the session cookies for authentication information before issuing the redirect specified in (c and d).

9.
