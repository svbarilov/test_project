require 'net/http'
require 'lingvo'




module Lingvo
  module BeforeHelpers

    def self.included(base)
      base.class_eval do

        if ENV['HEADLESS']  #When you run this thing from a command line you have a chance to specify that you want to run in a headless mode
          require 'headless'
          headless = Headless.new
        end

        before(:all) do  #This is what we do before each testing session
          if headless
            headless = Headless.new
            headless.start
          end


          #@user_hash = user_data(:user_admin).to_hash #this is how we initialize hashes that take data from fixtures
          @signin_url = Lingvo.settings[:sign_in_url]



          Sys::ProcTable.ps.each do |ps|        #Looking for all the processes in the system called FireFox and killing them
            if ps.comm.downcase =~ /firefox/
              Process.kill('KILL',ps.pid)
            end
          end



          browser = Watir::Browser.new :firefox   # Here we create a new browser instance



          @lingvo = Lingvo.new(:browser => browser)     #creating an object of a browser using the one created above (Taza)

          #@mediascape.sign_in_flow(:email => @user_hash[:email], :password => @user_hash[:password])  #initializing data for the "sign_in_flow"
        end



        after(:all) do
          # what we do after all tests
        end


        after(:each) do
          # what we do after each test
        end





      end
    end

  end
end
