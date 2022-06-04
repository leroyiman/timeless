class Match < ApplicationRecord
  belongs_to :search
  belongs_to :offer
  has_one :user, :through => :search

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
        'Email'=> 'wabisabi@ombuhub.com',
        'Name'=> 'Timeless'
      },
      "To" => [
        {
          "Email" => search.user.email,
          # Match.first.search.user.email
          "Name" => "search.user.fname"
          #Match.first.search.user.fname
        }
      ],

        'Subject'=> 'You have a Match :)!',
        'TextPart'=> 'Greetings from Mailjet!',
        'HTMLPart'=> '<h3>Dear Searcher,
        we are very happy to inform you, that we found a match for your Search. No Need to wait anymore, view the sofa and get it soon! :)
        Button to Click'
      # "TemplateID" => template_id,
      # "TemplateLanguage" => true,
      # "Variables" => variables
    }])

    p variable.attributes['Messages']
  end
end
