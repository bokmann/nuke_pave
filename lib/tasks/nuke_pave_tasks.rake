namespace :db do

  desc "drops, creates, migrates, and seeds database"
  task :nuke_pave => :environment do
    unless Rails.env == "Production"
      Rake::Task["db:drop"].execute
      logfile = Rails.root.join("log", "#{Rails.env}.log").to_s
      `rm #{logfile}`
      Rake::Task["db:create"].execute
      Rake::Task["db:migrate"].execute
      Rake::Task["db:seed"].execute
      Rake::Task["db:sample"].execute if ["development", "demo"].include?(Rails.env)
      puts "            --_--"
      puts "         (  -_    _)."
      puts "       ( ~       )   )"
      puts "     (( )  (    )  ()  )"
      puts "      (.   )) (       )"
      puts "        ``..     ..``"
      puts "             | |"
      puts "           (=| |=)"
      puts "             | |      "
      puts "         (../( )\.))"
      puts "Nuke and pave of #{Rails.env} complete."
    else
      puts "Sorry... won't touch production."
    end
  end

  desc "loads samples, if they exist."
  task :sample => :environment do
    f = File.join(Rails.root, "db", "samples.rb")
    if File.exists? f
      load f
    else
      puts "would have loaded the contents of #{f} if it existed..."
    end
  end
end