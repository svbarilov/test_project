require 'rubygems'

module Lingvo
  class Lingvo < ::Taza::Site

    # signing in on Home page
    def sign_in_flow(params={})
      sign_in_page.email.set(params[:email])
      sign_in_page.password.set(params[:password])
      sign_in_page.login.click
      top_nav.wait_for_all
    end

    def sign_in_flow_negative(params={})
      sign_in_page.email.set(params[:email])
      sign_in_page.password.set(params[:password])
      sign_in_page.login.click
    end

    def sign_out_flow
      top_nav.sign_out
      sleep(3)  # TODO remove sleep
      if top_nav.accounts.present? == true
        puts "Logout failed"
      else top_nav.accounts.present? == false
        puts "Logout Successful"
      end
    end

  end
end
