require 'selenium-webdriver'
require 'rspec'

describe 'Surfair qa' do 
	before(:all) do 
		# create a webdriver driver
		@driver = Selenium::WebDriver.for:chrome
		# open chrome browser to surfair login page
		@driver.get "https://staging.surfair.com/app/#/"
		# wait until element on page is found
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds
	end

	describe 'login' do 
		it 'signs me in' do 
			element_username = @driver.find_element(:id, 'input_001').send_keys "jason+test@surfair.com"
			element_password = @driver.find_element(:id, 'input_002').send_keys "jason90401"
			@driver.find_element(:class, 'button').click
		end
		# expect it to change to home page 
	end

	describe 'book a flight' do 
		it 'clicks Book a flight link' do 
			begin
				@wait.until{@driver.find_element(:link, 'Book a flight')}
			ensure
				element_book = @driver.find_element(:link, 'Book a flight')
				element_book.click
			end
			# expect it to click a book a flight link
		end

		it 'chooses a Hawthorne airport for departure' do 
			begin
				@wait.until{@driver.find_element(:partial_link_text, 'Hawthorne')}
			ensure
				element_depart = @driver.find_element(:partial_link_text, 'Hawthorne')
				element_depart.click
			end
		# expect it to chose Hawthorne airport
		end

		it 'chooses Oakland airport for arrival' do 
			begin
				@wait.until{@driver.find_element(:partial_link_text, 'Oakland')}
			ensure
				element_arrival = @driver.find_element(:partial_link_text, 'Oakland')
				element_arrival.click
			end
		end
		#expect it to chose Oakland airport
	end

	describe 'chose a date for travel' do 
		it 'moves the one month forward' do 
			begin
				@wait.until{@driver.find_element(:class, 'next').displayed?}
			ensure
				element_next_month = @driver.find_element(:class, 'next')
				element_next_month.click
			end
		end
		# expect the calendar to move forward a month

		it 'chooses day 13' do 
			begin
				@wait.until{@driver.find_element(:link_text, '13').displayed?}
			ensure
				element_day = @driver.find_element(:link_text, '13')
				element_day.click
			end
		end
		# expect the 13 day to be picked

		it 'books the first available flight' do 
			begin
				@wait.until{@driver.find_element(:class, 'button-book').displayed?}
			ensure
				element_book = @driver.find_element(:class, 'button-book')
				element_book.click
			end
		end
		# expect flight to be booked

		it 'views all of your flight' do 
			begin
				@wait.until {@driver.find_element(:link_text, 'Manage Flights')}
			ensure
				element_manage_flights = @driver.find_element(:link_text, 'Manage Flights')
				element_manage_flights.click
			end
		end
		# expect to see all booked flights

	end

	# describe 'canceling the flight' end
	# 	it ''
	# end


### last end ###
end
