ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "medellin.com",
    :user_name            => "jvidalba",
    :password             => "vrpRMB91",
    :authentication       => "plain",
    :enable_starttls_auto => true
}