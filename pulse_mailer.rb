require "action_mailer"

ActionMailer::Base.template_root = File.dirname(__FILE__)
ActionMailer::Base.delivery_method = :sendmail

class PulseMailer < ActionMailer::Base
  
  def error_notice(my_recipients, log_info)
    recipients    my_recipients.join(',')
    subject       "PulseCheck Site Error"
    from          "no-reply@uiclients.com"
    body          :log_info => log_info
  end
end