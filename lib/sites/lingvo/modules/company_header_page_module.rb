module Mediascape
  module CompanyHeaderPageModule
    def self.included(base)
      base.class_eval do



        #TITLES ------------------------------------------------------------------------------------------------------------
        element(:account_address)               { browser.address(:class, "account-address").when_present }
        element(:account_name)                  { browser.h1(:class, "account-name").when_present }

        #LINKS -------------------------------------------------------------------------------------------------------------
        element(:show_map_link)                 { browser.link(:id, "js-map-popover").when_present }
        element(:add_contact)                   { browser.link(:text, "Add new contact").when_present }

        #BUTTONS and DROPDOWNS-----------------------------------------------------------------------------------------------
        element(:account_actions_button)        { browser.link(:id, "js-btn-account-actions").when_present }
        element(:edit_master_account_info)      { browser.link(:id, "js-company-edit").when_present }
        element(:edit_master_traffic_settings)  { browser.link(:id, "js-company-settings").when_present }
        element(:edit_market_associations)      { browser.link(:id, "js-company-defaults").when_present }
        element(:edit_account_reassign)         { browser.link(:id, "js-company-reassign").when_present }


        element(:follow_enabled)                { browser.link(:id => "js-btn-follow-account", :class => "btn following-btn following btn-primary").when_present }
        element(:follow_disabled)               { browser.link(:id =>  "js-btn-follow-account", :class => "btn following-btn").when_present }

        #MISC ---------------------------------------------------------------------------------------------------------
        element(:existing_contact)              { |name| browser.div(:class, "row-fluid account-contacts").link(:text, /#{name}/)}  # using block variable to click contacts by name

        ##################################################################################################################


        ##################################################################################################################

        def m_edit_account_information
          account_actions_button.click
          edit_master_account_info.click
        end

        def m_edit_master_traffic_settings
          account_actions_button.click
          edit_master_traffic_settings.click
        end

        def m_edit_market_associations
          account_actions_button.click
          edit_market_associations.click
        end

        def m_edit_account_reassign
          account_actions_button.click
          edit_account_reassign.click
        end



        ###
      end
    end
  end
end
