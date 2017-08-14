class ApplicationMailer < ActionMailer::Base
  default from: 'postmaster@example.org'
  default to: 'admin@example.org'
  layout 'mailer'

  #
  # Send an email once a game was liked
  #
  def send_email_as_game_was_liked(result)
      @result = result
      mail subject: "Arcade Videogame Catalog - New Like"
  end
end
