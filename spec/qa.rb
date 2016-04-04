require 'selenium-webdriver'
require 'rspec'

RSpec.describe 'Surfair booking and canceling flight' do 
	before(:all) do 
		# create a webdriver driver
		@driver = Selenium::WebDriver.for:chrome
		# open chrome browser to surfair login page
		@driver.get "https://staging.surfair.com/app/#/"
		# wait until element on page is found
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds
	end

	after(:each) do 
		sleep 10
	end

	describe 'login' do 
		it 'signs me in' do 
			element_username = @driver.find_element(:id, 'input_0').send_keys ""
			element_password = @driver.find_element(:id, 'input_1').send_keys ""
			@driver.find_element(:class, 'button').click
			expect(@driver.current_url).to eql("https://staging.surfair.com/app/#/")
		end
	end

	describe 'book a flight' do 
		it 'clicks Book a flight link' do 
			begin
				@wait.until{@driver.find_element(:link, 'Book a flight')}
			ensure
				element_book = @driver.find_element(:link, 'Book a flight')
				element_book.click
			end
			expect(@driver.current_url).to eql("https://staging.surfair.com/app/#/book")
		end

		it 'chooses a Hawthorne airport for departure' do 
			begin
				@wait.until{@driver.find_element(:partial_link_text, 'Hawthorne')}
			ensure
				element_depart = @driver.find_element(:partial_link_text, 'Hawthorne')
				element_depart.click
			end
		expect(@driver.current_url).to include("HHR")
		end

		it 'chooses Oakland airport for arrival' do 
			begin
				@wait.until{@driver.find_element(:partial_link_text, 'Oakland')}
			ensure
				element_arrival = @driver.find_element(:partial_link_text, 'Oakland')
				element_arrival.click
			end
		expect(@driver.current_url).to include("OAK")	
		end
	end

	describe 'chose a date for travel' do 
		it 'chooses the next month' do 
			begin
				@wait.until{@driver.find_element(:class, 'next').displayed?}
			ensure
				element_next_month = @driver.find_element(:class, 'next')
				element_next_month.click
			end
		element_current_month = @driver.find_elements(:class, 'month')
		element_current_month.each do |m|
			 if m.text() == m.text()
			 	element_next_month.click
			 else
			 	puts "this month is #{m.text()}"
			 end
		end
		expect(@driver.current_url).to eql('https://staging.surfair.com/app/#/book?from=HHR&to=OAK')		
		end

		it 'chooses day 13' do 
			begin
				@wait.until{@driver.find_element(:link_text, '13').displayed?}
			ensure
				element_day = @driver.find_element(:link_text, '13')
				element_day.click
			end
			expect(@driver.current_url).to include("13")
		end

		it 'books the first available flight' do 
			begin
				@wait.until{@driver.find_element(:class, 'button-book').displayed?}
			ensure
				element_book = @driver.find_element(:class, 'button-book')
				element_book.click
			end
			expect(@driver.current_url).to eql("https://staging.surfair.com/app/#/book?from=HHR&to=OAK&day=2016-05-13")
		end
	end

	describe 'canceling the flight' do
		it 'views all of the booked flights' do 
			begin
				@wait.until { @driver.find_element(:link, 'Manage Flights')}
			ensure
				element_manage_flight = @driver.find_element(:link, 'Manage Flights')
				element_manage_flight.click
			end
			expect(@driver.current_url).to eql("https://staging.surfair.com/app/#/")
		end

		it 'cancels the flight' do
			begin
				element_more = @driver.find_element(:class, 'fa-chevron-down')
				element_more.click
			ensure 
				element_cancel = @driver.find_elements(:class, 'button')
				element_cancel.each do |t|
					if t.text() == "Cancel This Flight"
						t.click
						puts "Found the cancel button"
					else
						puts t.text()
					end
				end
			end
			expect(@driver.current_url).to eql("https://staging.surfair.com/app/#/")
		end

		it 'confirm flight cancel' do
			element_cancel = @driver.find_elements(:class, 'button')
			element_cancel.each do |t|
				if t.text() == 'Cancel Flight'
					t.click
					puts  "Found the confirm cancel button"
				else
					puts t.text()
				end
			end
			expect(@driver.current_url).to eql("https://staging.surfair.com/app/#/")
		end
	end

	describe 'logout' do 
		it 'logout of profile' do
			begin
				element_profile = @driver.find_element(:id, 'profile-menu')
				element_profile.click
				puts "Clicked on profile"
			ensure
				element_logout = @driver.find_element(:partial_link_text, 'Logout')
				element_logout.click
				puts "logged out"
			end
			expect(@driver.current_url).to eql("https://staging.surfair.com/app/#/profile")
		end
	end

	after(:all) do 
		@driver.quit
	end

### last end ###
end
