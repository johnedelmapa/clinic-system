class ApplicationMailer < ActionMailer::Base
  require 'rest-client'
  default from: "tup-appointment@info.com"
  layout "mailer"
end
