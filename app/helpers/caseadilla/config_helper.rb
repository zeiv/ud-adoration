module Caseadilla
  module ConfigHelper
    
    # Name of website or client — used throughout Caseadilla.
    def caseadilla_config_website_name
      'Caseadilla'
    end

    # Filename of logo image. Ideally, it should be a transparent PNG around 140x30px
    def caseadilla_config_logo
      'caseadilla/caseadilla.png'
    end

    # The server hostname where Caseadilla will run
    def caseadilla_config_hostname
      if Rails.env.production?
        'http://www.caseadillacms.com'
      else
        'http://0.0.0.0:3000'
      end
    end

    # The sender address used for email notifications
    def caseadilla_config_email_from_address
      'donotreply@caseadillacms.com'
    end
  
    # The initial page the user is shown after they sign in or click the logo. Probably this should be set to the first tab.
    # Do not point this at caseadilla/index!
    def caseadilla_config_dashboard_url
      url_for :controller => :caseadilla, :action => :blank
    end
  
    # A list of stylesheets to include. Do not remove the core caseadilla/caseadilla, but you can change the load order, if required.
    def caseadilla_config_stylesheet_includes
      %w[caseadilla/caseadilla caseadilla/custom]
    end
  
    # A list of JavaScript files to include. Do not remove the core caseadilla/caseadilla, but you can change the load order, if required.
    def caseadilla_config_javascript_includes
      %w[caseadilla/caseadilla caseadilla/custom]
    end
    
  end
end