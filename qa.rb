### working non test code. ###

require 'selenium-webdriver'
require 'rspec'

@driver = Selenium::WebDriver.for:chrome
@driver.get "https://staging.surfair.com/app/#/"

# signin to login page1
element_email = @driver.find_element(:id, 'input_001')
element_email.send_keys "jason+test@surfair.com"
element_password = @driver.find_element(:id, 'input_002')
element_password.send_keys "jason90401"
@driver.find_element(:class, "button").click
puts "Logged in succesful."

# wait till whole page loads and clicks 'Book a flight'
	@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds
begin
  @wait.until { @driver.find_element(:link, "Book a flight")}
ensure
	element_book = @driver.find_element(:link, "Book a flight")
	element_book.click
	puts "Clicked 'Book a flight' link."
end

# choose departing city.
	@wait
begin
	@wait.until { @driver.find_element(:partial_link_text, 'Hawthorne')}
ensure	
	element_depart = @driver.find_element(:partial_link_text, 'Hawthorne')
	element_depart.click
	sleep 3
	puts "Clicked and chose Hawthorne airport departure."
end

# choose an arrivival city.
	@wait
begin 
	@wait.until { @driver.find_element(:partial_link_text, 'Oakland')}
ensure
	element_arriving = @driver.find_element(:partial_link_text, 'Oakland')
	element_arriving.click
	sleep 3
	puts "Clicked and chose Oakland airport arrival. "
end

# choose date. 
# Skip forward one month. 
	@wait
begin
	@wait.until {@driver.find_element(:class, 'next')}
ensure
	element_next = @driver.find_element(:class, 'next')
	element_next.click
	sleep 1
	puts "Clicked 'next' to move calendar to next month."
end

# Choose day 13.
	@wait
begin
	@wait.until { @driver.find_element(:link_text, '13')}
ensure
	element_date = @driver.find_element(:link_text, '13')
	element_date.click
	sleep 1
	puts "Clicked day '13'." 
end

# Book first flight. 
	@wait
begin
	@wait.until {@driver.find_element(:class, 'button-book')}
ensure
	element_book = @driver.find_element(:class, 'button-book')
	element_book.click
	sleep 3
	puts "Clicked 'book' flight button."
end

# CLick Manage flights link
	@wait
begin
	@wait.until { @driver.find_element(:link, 'Manage Flights')}
	sleep 3
	puts "Allow page to load "
ensure
	element_manage_flight = @driver.find_element(:link, 'Manage Flights')
	element_manage_flight.click
	sleep 3
	puts "Clicked 'Manage Flights' link"
end

# Click More and Cancel this flight 
@wait 
begin
	sleep 3
	element_more = @driver.find_element(:class, 'fa-chevron-down')
	element_more.click
	puts "div click."
	sleep 3
ensure 
	@wait
	element_cancel = @driver.find_elements(:class, 'button')
	element_cancel.each do |t|
		if t.text() == "Cancel This Flight"
			t.click
			puts "found the cancel button"
		# elsif
		# 	sleep 3
		# 	t.click
		else
			puts t.text()
		end
end
	
# Click to confirm cancel flight
@wait
element_cancel = @driver.find_elements(:class, 'button')
element_cancel.each do |t|
		if t.text() == "Cancel Flight"
			t.click
			puts "found the confirm cancel button"
		else
			puts t.text()
		end
	end
	puts "flight cancelled"
end

# #logout
@wait
sleep 3
begin
	element_profile = @driver.find_element(:id, 'profile-menu')
	element_profile.click
	puts "Clicked on profile"
	sleep 3
ensure
	element_logout = @driver.find_element(:partial_link_text, 'Logout')
	element_logout.click
	puts "logged out"
end



