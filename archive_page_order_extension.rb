# Uncomment this if you reference any of your controllers in activate
if Radiant::Version.to_s >= "0.8.0"
  require_dependency 'application_controller'
else
  require_dependency 'application'
end

class ArchivePageOrderExtension < Radiant::Extension
  version "1.0"
  description "Archive pages in descending order"
  url "http://yourwebsite.com/page_order"
  
  def activate
    admin.page.index.add :sitemap_head, 'created_at_header'
    admin.page.index.add :node, 'created_at'
    admin.page.index.add :top, 'header'
    
    if defined?(ArchivePage)
      ArchivePage.send :include, ArchiveOrderExtension
    else
      logger.warn "ArchivePage does not exist. Archive Order extension will be disclaimed."
    end
  end
  
  def deactivate
    # admin.tabs.remove "Page Order"
  end
  
  def logger
    RAILS_DEFAULT_LOGGER
  end
end
