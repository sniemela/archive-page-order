module ArchiveOrderExtension
  def self.included(base)
    
    # This is an extension to order all children of an archive page in descending order
    base.has_many :children,
             :class_name => 'Page',
             :foreign_key => 'parent_id',
             :order => 'created_at DESC'
  end
end