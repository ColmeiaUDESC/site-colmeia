ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => ENV['SENDGRID_API_KEY'],
    :domain => 'colmeiaudesc.herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}