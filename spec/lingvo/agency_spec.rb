# require 'spec_helper'
# require 'mediascape'
# 
# 
# 
# describe "AgencyAccount" do #Here we refer to the PO which contains all the elements
#   include Taza::Fixtures::Mediascape #Taza is a gem that defines the structure of the whole testing framework
#   include Mediascape::BeforeHelpers #This will automatically include everything from before helpers
# 
#   ######################################################################################################################
#   before(:all) do
# 
#     ###!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#     #    #Initializing AGENCY hashes
#     @agency_data            = new_company_data(:agency).to_hash             # We are taking the data from the new_company_data.yml
#     @time_now_agency        = timestamp        # Making the time stamp more readable
#     @agency_data[:name]     = "#{@agency_data[:name]}_#{timestamp}"  # Adding a time stamp to our Agency name
#     @agency                 = @mediascape.init_create_agency(@agency_data)  # @agency now holds agency's url; create new agency flow (from new_company_flow.rb), using data from @agency_data hash to fill in the forms
#     ###!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#     ##
#     ###!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#     # Initializing contact hashes
#     @contact_data           = new_contact_data(:new_contact).to_hash
#     @first_name_blank       = new_contact_data(:first_name_blank).to_hash
#     @last_name_blank        = new_contact_data(:last_name_blank).to_hash
#     @error_contact          = error_messages_data(:new_contact).to_hash     # contact error messages
#     @edit_contact_data      = edit_contact_data(:edit_contact).to_hash
#     ###!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#     ##
#     ###!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#     # Initializing hashes for ERROR message validation
#     @edit_agency            = edit_company_data(:agency).to_hash            # Data to edit company, we are taking the data from the edit_company_data.yml
#     @edit_agency[:name]     = "#{@edit_agency[:name]}_#{timestamp}"
#     @ag_name_blank          = new_company_data(:ag_name_blank).to_hash            # Agency blank name data
#     @ag_name_too_short      = new_company_data(:ag_name_too_short).to_hash  # Agency name too short data
#     @ag_name_too_long       = new_company_data(:ag_name_too_long).to_hash   # Agency name too long data
#     @ag_invalid_address     = new_company_data(:ag_invalid_address).to_hash
#     @ag_commission          = new_company_data(:ag_commission).to_hash      # Agency 'commission is not a number' data
#     @ag_commission[:name]   = "#{@ag_commission[:name]}_#{timestamp}"   # Adding time stamp to avoid duplicate names
#     @error_account          = error_messages_data(:account).to_hash         # New Account Error messages data
#     ###!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#     ##
# 
#     ###
#   end
# 
#   before(:each) do
#   end
#   ######################################################################################################################
# 
# 
# 
#   ######################################################################################################################
#   it "Create a new Agency Account" do  #Verifying that the account we created using before all helper Exists
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency
#     @mediascape.accounts_page.account_name.text.include?(@agency_data[:name]).should == true            #verify new agency was created (UI level)
#     @mediascape.accounts_page.account_address.text.include?(@agency_data[:address]).should == true
#   end
#   ######################################################################################################################
#   it "Follow_Button/Agency should be present" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency
#     (@mediascape.accounts_page.follow_disabled.present? || @mediascape.accounts_page.follow_enabled.present?).should == true
#   end
#   ######################################################################################################################
#   it "Media Buying Service Yes/No buttons should be present (No by default)" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency
#     @mediascape.accounts_page.new_account_button.click
#     @mediascape.new_company_page.agency_button.click
#     (@mediascape.new_company_page.yes_media_buying_serv.present? && @mediascape.new_company_page.no_media_buying_serv_en.present?).should == true
#   end
#   ######################################################################################################################
#   it "Cancel Create Agency" do
#     @mediascape.accounts_page.new_account_button.click    # click blue "new Account" button
#     @mediascape.new_company_page.agency_button.click
#     @mediascape.new_company_page.cancel_new_company.click           # create new agency flow (from new_company_flow.rb), using data from @agency_data hash to fill in the forms
#     @mediascape.accounts_page.add_contact.exists?.should == true            #  if contact link is present => cancel button works
#   end
#   ######################################################################################################################
#   it 'Edit Agency Information' do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency #This line describes what the test case is supposed to do.
#     @mediascape.accounts_page.m_edit_account_information
#     @mediascape.edit_agency(@edit_agency)               #this comes from edit_company_flow.rb
#     @mediascape.accounts_page.account_name.text.include?(@edit_agency[:name]).should == true            #verify agency modified
#     @mediascape.accounts_page.account_address.text.include?(@edit_agency[:address]).should == true
#     @mediascape.accounts_page.m_edit_account_information      # Renaming account back (we need this for duplicate names test)
#     @mediascape.edit_agency(@agency_data)
#   end
#   ######################################################################################################################
#   it "Cancel Edit Agency" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency
#     @mediascape.accounts_page.m_edit_account_information
#     @mediascape.edit_company_page.cancel_edit_company.click
#     @mediascape.accounts_page.add_contact.exists?.should == true
#   end
#   ######################################################################################################################
#   it "N: Agency => Error message 'blank name' " do
#     @mediascape.accounts_page.new_account_button.click
#     @mediascape.create_agency(@ag_name_blank)
#     @mediascape.new_company_page.error_message.text.include?(@error_account[:blank]).should == true    # Checking appropriate error message
#     @mediascape.new_company_page.error_title.text.include?(@error_account[:general]).should == true    # Checking appropriate error message
#   end
#   ######################################################################################################################
#   it "N: Agency => Error message 'name too short' " do
#     @mediascape.accounts_page.new_account_button.click
#     @mediascape.create_agency(@ag_name_too_short)
#     @mediascape.new_company_page.error_message.text.include?(@error_account[:too_short]).should == true  # Checking appropriate error message
#     @mediascape.new_company_page.error_title.text.include?(@error_account[:general]).should == true      # Checking appropriate error message
#   end
#   ######################################################################################################################
#   it "N: Agency => Error message 'name too long' " do
#     @mediascape.accounts_page.new_account_button.click
#     @mediascape.create_agency(@ag_name_too_long)
#     @mediascape.new_company_page.error_message.text.include?(@error_account[:too_long]).should == true    # Checking appropriate error message
#     @mediascape.new_company_page.error_title.text.include?(@error_account[:general]).should == true       # Checking appropriate error message
#   end
#   ######################################################################################################################
#   it "N: Agency => Error message 'commission not number' " do
#     @mediascape.accounts_page.new_account_button.click
#     @mediascape.create_agency(@ag_commission)
#     @mediascape.new_company_page.error_message.text.include?(@error_account[:commission]).should == true    # Checking appropriate error message
#     @mediascape.new_company_page.error_title.text.include?(@error_account[:general]).should == true         # Checking appropriate error message
#   end
#   ######################################################################################################################
#   it "N: Agency => Error message 'already exists' " do
#     @mediascape.accounts_page.new_account_button.click
#     @mediascape.create_agency(@agency_data)
#     @mediascape.new_company_page.error_exists.text.include?(@error_account[:ag_duplicate]).should == true    # Checking appropriate error message
#     @mediascape.new_company_page.error_title.text.include?(@error_account[:general]).should == true         # Checking appropriate error message
#   end
#   ######################################################################################################################
#   it "N: Agency => Error message 'invalid address' " do
#     @mediascape.accounts_page.new_account_button.click
#     @mediascape.create_agency(@ag_invalid_address)
#     @mediascape.new_company_page.error_exists.text.include?(@error_account[:invalid_address]).should == true    # Checking appropriate error message
#     @mediascape.new_company_page.error_title.text.include?(@error_account[:general]).should == true         # Checking appropriate error message
#   end
#   ######################################################################################################################
#   it "Create a new Agency Contact" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency
#     @mediascape.create_new_contact(@contact_data)
#     @mediascape.accounts_page.existing_contact("#{@contact_data[:first_name]} #{@contact_data[:last_name]}").present?.should == true
#   end
#   ######################################################################################################################
#   it "Edit Agency contact" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency           #Going to the URL of earlier created Agency
#     @mediascape.create_new_contact(@contact_data)
#     @mediascape.accounts_page.existing_contact("#{@contact_data[:first_name]} #{@contact_data[:last_name]}").click
#     @mediascape.edit_contact(@edit_contact_data)
#     @mediascape.accounts_page.existing_contact("#{@edit_contact_data[:first_name]} #{@edit_contact_data[:last_name]}").when_present.present?.should == true
#   end
#   ######################################################################################################################
#   it "Deletes earlier created Agency contact" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency           #Going to the URL of earlier created Agency
#     @mediascape.accounts_page.existing_contact("#{@edit_contact_data[:first_name]} #{@edit_contact_data[:last_name]}").click # Clicks on the new contact we have created in the previous TC
#     @mediascape.new_contact_page.delete_button.click
#     @mediascape.accounts_page.existing_contact("#{@edit_contact_data[:first_name]} #{@edit_contact_data[:last_name]}").present?.should == false
#   end
#   ######################################################################################################################
#   it "N: Agency/Contact Error message 'blank first name '" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency
#     @mediascape.neg_create_new_contact(@first_name_blank)
#     @mediascape.new_contact_page.contact_error_message.text.include?(@error_contact[:first_name_blank]).should == true    # Checking appropriate error message
#     @mediascape.new_contact_page.contact_error_title.text.include?(@error_contact[:general]).should == true
#   end
#   ######################################################################################################################
#   it "N: Agency/Contact Error message 'blank last name '" do
#     @mediascape.browser.goto(@agency) if @mediascape.browser.url != @agency
#     @mediascape.neg_create_new_contact(@last_name_blank)
#     @mediascape.new_contact_page.contact_error_message.text.include?(@error_contact[:last_name_blank]).should == true    # Checking appropriate error message
#     @mediascape.new_contact_page.contact_error_title.text.include?(@error_contact[:general]).should == true
#   end
# 
# 
# ###
# end