require File.dirname(__FILE__) + '/../test_helper'

class ArchiveOrderExtensionTest < Test::Unit::TestCase
  fixtures :pages
  
  def test_should_not_order_pages_with_created_at
    assert_not_equal 'created_at DESC', Page.reflections[:children].options[:order]
  end
  
  def test_should_has_included_extension_method
    assert_equal 'created_at DESC', ArchivePage.reflections[:children].options[:order]
  end
  
  def test_should_order_articles_of_archive_with_created_at
    assert_equal 'ArchivePage', pages(:archive).class_name
    assert pages(:archive).children.first.created_at > pages(:archive).children.last.created_at
  end
end