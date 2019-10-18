module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_action :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = "The website portfolio of Dmitry Neladnov"
    @seo_keywords = "Neladnov Dmitry portfolio"
  end
end