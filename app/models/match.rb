class Match < ApplicationRecord
  belongs_to :search
  belongs_to :offer

  # after_create :send_email

  # def send_email
  #   # variable = Mailjet::Send.create(messages: [{
  #   #   'From'=> {
  #   #     'Email'=> 'leroy.macartney@googlemail.com',
  #   #     'Name'=> 'Leroy'
  #   #   },
  #   #   'To'=> [
  #   #     {
  #   #       'Email'=> 'leroy.macartney@googlemail.com',
  #   #       'Name'=> 'Leroy'
  #   #     }
  #   #   ],
  #   #   'Subject'=> 'Greetings from Mailjet.',
  #   #   'TextPart'=> 'My first Mailjet email',
  #   #   'HTMLPart'=> '<h3>Dear passenger 1, welcome to <a href=\'https://www.mailjet.com/\'>Mailjet</a>!</h3><br />May the delivery force be with you!',
  #   #   'CustomID' => 'AppGettingStartedTest'
  #   # }]
  #   # )
  #   # p variable.attributes['Messages']

  #    #what the messages look like:
  #   Mailjet::Send.create(messages: [{
  #     "To" => [
  #       {
  #         "Email" => user.email,
  #         "Name" => user.email_name
  #       }
  #     ],
  #     "TemplateID" => template_id,
  #     "TemplateLanguage" => true,
  #     "Variables" => variables
  #   }]
  # end

end
