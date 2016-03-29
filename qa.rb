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

	# after(:each) do 
	# 	sleep 10
	# end

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

		it 'chooses a random airport for departure' do 
			begin
				sleep 10
			ensure
				element_book_chevron = @driver.find_elements(:class, 'fa-chevron-right')
				el_bk_ch = element_book_chevron.length
				element_book_chevron[rand(0..el_bk_ch)].click
			end
		end

		# it 'chooses random airport for arrival' do 
		# 	begin
		# 		sleep 10
		# 	ensure
		# 		element_book_chevron = @driver.find_elements(:class, 'fa-chevron-right')
		# 		el_bk_ch = element_book_chevron.length
		# 		element_book_chevron[rand(0..el_bk_ch)].click
		# 		# # element_book_chevron.each do |t|
		# 		# end
		# 	end
		# end
		#expect it to chose Oakland airport
	end

	# describe 'chose a date for travel' do 
	# 	it 'moves the one month forward' do 
	# 		begin
	# 			@wait.until{@driver.find_element(:class, 'next').displayed?}
	# 		ensure
	# 			element_next_month = @driver.find_element(:class, 'next')
	# 			element_next_month.click
	# 		end
	# 	end
	# 	# expect the calendar to move forward a month

	# 	it 'chooses day 13' do 
	# 		begin
	# 			@wait.until{@driver.find_element(:link_text, '13').displayed?}
	# 		ensure
	# 			element_day = @driver.find_element(:link_text, '13')
	# 			element_day.click
	# 		end
	# 	end
	# 	# expect the 13 day to be picked

	# 	it 'books the first available flight' do 
	# 		begin
	# 			@wait.until{@driver.find_element(:class, 'button-book').displayed?}
	# 		ensure
	# 			element_book = @driver.find_element(:class, 'button-book')
	# 			element_book.click
	# 		end
	# 	end
	# 	# expect flight to be booked
	# end

	# describe 'canceling the flight' do
	# 	it 'views all of your flights' do 
	# 		begin
	# 			# sleep 5
	# 			@wait.until { @driver.find_element(:link, 'Manage Flights')}
	# 		ensure
	# 			# sleep 5
	# 			element_manage_flight = @driver.find_element(:link, 'Manage Flights')
	# 			element_manage_flight.click
	# 		end
	# 	end
	# 	# expect to see all booked flights

	# 	it 'cancels the flight' do
	# 		begin
	# 			# sleep 5
	# 			element_more = @driver.find_element(:class, 'fa-chevron-down')
	# 			element_more.click
	# 		ensure 
	# 			# sleep 5
	# 			element_cancel = @driver.find_elements(:class, 'button')
	# 			element_cancel.each do |t|
	# 				if t.text() == "Cancel This Flight"
	# 					t.click
	# 					puts "Found the cancel button"
	# 				else
	# 					puts t.text()
	# 				end
	# 			end
	# 		end
	# 	end

	# 	it 'confirm flight cancel' do
	# 		element_cancel = @driver.find_elements(:class, 'button')
	# 		element_cancel.each do |t|
	# 			if t.text() == 'Cancel Flight'
	# 				t.click
	# 				puts "Found the Confirm cancel buton"
	# 			else
	# 				puts t.text()
	# 			end
	# 		end
	# 	end
	# end

	# describe 'logout' do 
	# 	it 'logs out and closes browser ' do
	# 		begin
	# 			element_profile = @driver.find_element(:id, 'profile-menu')
	# 			element_profile.click
	# 			puts "Clicked on profile"
	# 		ensure
	# 			element_logout = @driver.find_element(:partial_link_text, 'Logout')
	# 			element_logout.click
	# 			# @driver.quit
	# 			puts "logged out"
	# 		end
	# 	end
	# end

### last end ###
end
