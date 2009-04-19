# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ArchivePageOrderExtension < Radiant::Extension
  version "1.0"
  description "Archive pages in descending order"
  url "http://yourwebsite.com/page_order"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :page_order
  #   end
  # end
  
  def activate
    admin.page.index.add :sitemap_head, 'created_at_header'
    admin.page.index.add :node, 'created_at'
    admin.page.index.add :top, 'header'
  end
  
  def deactivate
    # admin.tabs.remove "Page Order"
  end
  
end
