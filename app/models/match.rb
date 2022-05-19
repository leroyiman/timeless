class Match < ApplicationRecord
  belongs_to :search
  belongs_to :offer
  has_one :user, :through => :search


  # belongs_to :user, :through => :search

  after_create :send_email

  def send_email
    p "Mail sended?"
    # variable = Mailjet::Send.create(messages: [{
    #   'From'=> {
    #     'Email'=> 'leroy.macartney@googlemail.com',
    #     'Name'=> 'Leroy'
    #   },
    #   'To'=> [
    #     {
    #       'Email'=> 'leroy.macartney@googlemail.com',
    #       'Name'=> 'Leroy'
    #     }
    #   ],
    #   'Subject'=> 'Greetings from Mailjet.',
    #   'TextPart'=> 'My first Mailjet email',
    #   'HTMLPart'=> '<h3>Dear passenger 1, welcome to <a href=\'https://www.mailjet.com/\'>Mailjet</a>!</h3><br />May the delivery force be with you!',
    #   'CustomID' => 'AppGettingStartedTest'
    # }]
    # )
    # p variable.attributes['Messages']

     #what the messages look like:
     variable = Mailjet::Send.create(messages: [{
      'From'=> {
        'Email'=> 'whatever@google.com',
        'Name'=> 'Me'
      },
      "To" => [
        {
          "Email" => search.user.email,
          # Match.first.search.user.email
          "Name" => "search.user.fname"
          #Match.first.search.user.fname
        }
      ],

        'Subject'=> 'My first Mailjet Email!',
        'TextPart'=> 'Greetings from Mailjet!',
        'HTMLPart'=> '<h3>Dear passenger 1, welcome to <a href=\'https://www.mailjet.com/\'>Mailjet</a>!</h3><br />May the delivery force be with you!'
      # "TemplateID" => template_id,
      # "TemplateLanguage" => true,
      # "Variables" => variables
    }])

    p variable.attributes['Messages']
  end
end
