namespace :radiant do
  namespace :extensions do
    namespace :page_order do
      
      desc "Runs the migration of the Page Order extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PageOrderExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PageOrderExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Page Order to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from PageOrderExtension"
        Dir[PageOrderExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PageOrderExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
