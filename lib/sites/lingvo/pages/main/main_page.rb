require 'rubygems'
require 'taza/page'



module Lingvo

  class MainPage < ::Taza::Page


    #include CompanyHeaderPageModule   # this includes sub page form modules folder (if we need to include subpage)


#########################################################################################################################
    element(:forums_button)                { browser.div(:class => "square socialLinks").a(:href => "http://forum.lingvo.ru/?utm_source=RU&utm_medium=lingvo.ru&utm_campaign=lingvox5&utm_content=main-page-icon").when_present }




    #filter :wait_for_last, :all
    #filter :wait_for_new_account, :new_account_button


    #filter is a Taza method it takes 2 parameters in this case :wait_for_last (is just a method we created) and :all  (or we can also specify elements we want this filter to apply to)
    # where :all on of the arguments :all comes with Taza. It does everything argument 1 specifies to the elements specified by arg 2. in this case
    # all of them.


    #----------------------------- MULTI-CLICK METHODS------------------------------------------------------------------
    #"Search by" button options ----------------------------------------------------------------------------------------
    def m_search_by_master #Clicks on "search by Master"
      search_by.click
      search_by_search_by_master.click
      wait_for_ajax
    end

  end
end
