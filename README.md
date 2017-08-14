# Ruby Sample Single Page Application, written in Ruby and Vue.JS

This is a sample Ruby project, done as a 'Single Page App', which
demonstrates an arcade video game catalogue.

Note that this ruby app has only been tested on Ubuntu 16.04, however in
theory it ought to work on any popular Linux distro.

# Installation

0) If you are testing this on a fresh docker or virtual image, it might
   be necessary to install the following:

   `apt-get install sqlite3 libsqlite3-dev npm make gcc`

   `apt-get install libxml2 zlib1g zlib1g-dev tzdata`

   The import script requires the a number of gems, go ahead and install
   them like so:

   `gem install tzinfo-data sequel trollop sqlite3`

1) Import the sample CSV present in the data folder using the included
   'import_csv_to_sqlite3' script.

   `./import_csv_to_sqlite3 data/games.csv -o output.db`

   This script will also create a 'likes' table that will be used to record
   which user, at a given IP, have liked a specific game.

2) Copy the resulting output database to development, test, and production
   database files to the Rails application db folder.

   `cp output.db /path/to/video_game_app/db/development.db`

   `cp output.db /path/to/video_game_app/db/test.db`

   `cp output.db /path/to/video_game_app/db/production.db`

   That way, once the Rails server starts, it will contain all of the
   necessary data and tables needed to function.

3) Copy the jpeg game files located in data/game_images to the assets
   folder of the rails server. For example:

   `cp data/game_images/* /path/to/video_game_app/public/game_images/`

   For the sake of convenience, this step has already been done, but feel
   free to add additional images here should you want them.

4) Ensure that bundle install is ran to obtain all of the needed gems.

   `bundle install`

5) In order for this app to properly handle email notices upon the end-user
   pressing "Like", you will need to edit following lines of the below files:

   a) config/environments/development.rb

   b) config/environments/test.rb

   c) config/environments/production.rb

      config.action_mailer.smtp_settings = {
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :user_name            => "admin@example.org",
        :password             => "",
        :authentication       => :plain,
        :enable_starttls_auto => true
      }
   
   d) app/mailers/application_mailer.rb

      default from: 'postmaster@example.org'

      default to: 'admin@example.org'

   Note that the default choice of protocol is SMTP at port 587. You may
   need to adjust some or all of these settings to match your current mail
   configuration. Change the value of those parameters using a text editor,
   such as vim.

6) Installation should now be complete.

# Usage Instructions

0) By default, the server in the repo is set to development mode. Consider
   switching to test or production mode, should the situation warrant it.
   However, if you are merely taking the server for a quick rundown, then
   development mode is sufficient.

1) To take a quick run of the server, start rails:

   `rails s`

   Browse to the site, and click on the table headers to sort
   ascending / descending for the Name, Year or Manufacturer columns.

2) Click on the name of a given game title to open a pop-up. This allows
   you to learn more about it, such as notes or an image of a game in
   question.

3) Press on the 'Like' button on the bottom-right to like the game in
   question. Note, that it is recommended that you set the server and admin
   email addresses to real email addresses, that way you will receive
   notices to the email addresses defined earlier during step 5 of the
   installation.

4) Press on the 'X' button on the upper-right to close the pop-up.

5) Run the rspec / rails tests by switching to test mode and
   then running rake, like so:

   `rails db:environment:set RAILS_ENV=test`

   `rake`

   Note that one of the tests requires that the email be setup as per
   step 5 in the Installation instructions, for the purpose of testing
   the email subsystem.

6) If everything worked fine, and no errors occurred, your app is now
   setup is ready to be used.

# Author

Written by Robert Bisewski. For more information, contact:

* Website -> www.ibiscybernetics.com

* Email -> contact@ibiscybernetics.com

