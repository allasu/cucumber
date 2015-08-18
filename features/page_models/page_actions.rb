class PageActions

  def initialize browser
    @browser = browser
  end

  def visit
    @browser.navigate.to build_url
  end

  def build_url
    #original location for path: HomePage Class
    initial_url = self.path
    initial_url.gsub!("usps.com", get_environment)
  end

end
