require 'selenium-webdriver'
require 'capybara'
require 'rspec'

describe 'SurfAir QA' do

	before(:all) do 
		# create a webdriver driver
		@driver = Selenium::WebDriver.for:chrome
		# open chrome browser to surfair login page
		@driver.get "https://staging.surfair.com/app/#/"
		# wait until element on page is found
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds
	end

	describe 'login page' do 
		it 'should login with username and password' do 	
			# enter username 
			element_username = @driver.find_element(:id, 'input_001')
			element_username.send_keys "jason+test@surfair.com"
			# enter password
			element_password = @driver.find_element(:id, 'input_002')
			element_password.send_keys "jason90401"
			# click 'login' button
			@driver.find_element(:class, 'button').click
		end
		puts "Logged in successful"
end
# 		# it 'should allow the page to load' do 
# 		# 	@page_load
# 		# end

# 		it 'should click Book a flight link' do
# 			begin
# 				@wait.until {@driver.find_element(:link, 'Book a flight')}
# 			ensure
# 				element_book = @driver.find_element(:link, 'Book a flight')
# 				element_book.click
# 			end
# 		end
# 		puts "Clicked Book a flight link."
# 	##### 'login page' describe ####
# 	end

# 	describe 'choose departing and arriving airport' do 
# 		it 'should choose a departing city' do 
# 			begin
# 				@wait.until {@driver.find_element(:partial_link_text, 'Hawthorne')}
# 			ensure
# 				element_depart = @driver.find_element(:partial_link_text, 'Hawthorne')
# 				element_depart.click
# 			end
# 		end
# 		puts 'Depart from Hawthorne airport'

# 		it 'should choose an arriving city' do 
# 			begin
# 				@wait.until {@driver.find_element(:partial_link_text, 'Oakland')}
# 			ensure
# 				element_arriving = @driver.find_element(:partial_link_text, 'Oakland')
# 				element_arriving.click
# 			end
# 		end
# 		puts 'Arriving at Oakland airport'
# 	end

# 	describe 'choose date of flight and book first available flight' do 
# 		it 'should choose one month ahead' do
# 			begin
# 				@wait.until {@driver.find_element(:class, 'next').displayed?}
# 			ensure
# 				element_next = @driver.find_element(:class, 'next')
# 				element_next.click
# 			end
# 		end
# 		puts "Move forward one month"

# 		it 'should choose a date' do 
# 			begin
# 				@wait.until {@driver.find_element(:link_text, '13').displayed?}
# 			ensure
# 				element_date = @driver.find_element(:link_text, '13')
# 				element_date.click
# 			end
# 		end
# 		puts "Chose day 13"

# 		#### refactor code to choose random flight ###
# 		it 'should book first available flight' do
# 			begin
# 				@wait.until{@driver.find_element(:class, 'button-book').displayed?}
# 			ensure
# 				element_book = @driver.find_element(:class, 'button-book')
# 				element_book.click
# 			end 
# 			puts "Booked first available flight"
# 		end
# 	end

# 	describe 'allow page to load' do 
# 		it 'should let the page to load new elements' do 
# 			@page_load
# 		end
# 	end


# 	describe 'cancel flight procedure' do 
# 		it 'should click Manage Flights' do
# 			begin
# 				@wait.until {@driver.find_element(:link_text, 'Manage Flights')}
# 				@page_load
# 			ensure
# 				element_manage_flight = @driver.find_element(:link_text, 'Manage Flight')
# 				element_manage_flight.click
# 			end
# 		end

# 	end

####### last end #################
end



# # # CLick Manage flights link
# # 	@wait
# # begin
# # 	@wait.until { @driver.find_element(:link, 'Manage Flights')}
# # 	sleep 3
# # 	puts "Allow page to load "
# # ensure
# # 	element_manage_flight = @driver.find_element(:link, 'Manage Flights')
# # 	element_manage_flight.click
# # 	sleep 3
# # 	puts "Clicked 'Manage Flights' link"
# # end

# # # Click More and Cancel this flight 
# # @wait 
# # begin
# # 	sleep 3
# # 	element_more = @driver.find_element(:class, 'fa-chevron-down')
# # 	element_more.click
# # 	puts "div click."
# # 	sleep 3
# # ensure 
# # 	@wait
# # 	element_cancel = @driver.find_elements(:class, 'button')
# 	element_cancel.each do |t|
# 		if t.text() == "Cancel This Flight"
# 			t.click
# 			puts "found the cancel button"
# 		# elsif
# 		# 	sleep 3
# 		# 	t.click
# 		else
# 			puts "cannot find button to cancel"
# 		end
# end
	
# # Click to confirm cancel flight
# @wait
# element_cancel = @driver.find_elements(:class, 'button')
# element_cancel.each do |t|
# 		if t.text() == "Cancel Flight"
# 			t.click
# 			puts "found the confirm cancel button"
# 		else
# 			puts "cannot find button to cancel"
# 		end
# 	end
# 	puts "flight cancelled"
# end

# # #logout
# @wait
# sleep 3
# begin
# 	element_profile = @driver.find_element(:id, 'profile-menu')
# 	element_profile.click
# 	puts "Clicked on profile"
# 	sleep 3
# ensure
# 	element_logout = @driver.find_element(:partial_link_text, 'Logout')
# 	element_logout.click
# 	puts "logged out"
# end



