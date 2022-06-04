class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :timeslot
  after_save :notify_offer_user
  def offer_user
    timeslot.offer.user
  end

  def notify_offer_user
    if confirmed == "yes"
      # send message to the offer_user (text of the message)
      p "Mail sended?"
      variable = Mailjet::Send.create(messages: [{
        'From'=> {
          'Email'=> 'wabisabi@ombuhub.com',
          'Name'=> 'Timeless'
        },
        "To" => [
          {
            "Email" => user.email,
            # Match.first.search.user.email
            "Name" => "search.user.fname"
            #Match.first.search.user.fname
          }
        ],

          'Subject'=> 'Your Booking is confirmed :)!',
          'TextPart'=> 'Greetings from Mailjet!',
          'HTMLPart'=> '<h3>Dear Searcher,
          we are very happy to inform you, that we found a match for your Search. No Need to wait anymore, view the sofa and get it soon! :)
          Button to Click'
        # "TemplateID" => template_id,
        # "TemplateLanguage" => true,
        # "Variables" => variables
      }])

      p variable.attributes['Messages']
    else
      p "Mail sended?"
      variable = Mailjet::Send.create(messages: [{
        'From'=> {
          'Email'=> 'wabisabi@ombuhub.com',
          'Name'=> 'Timeless'
        },
        "To" => [
          {
            "Email" => user.email,
            # Match.first.search.user.email
            "Name" => "search.user.fname"
            #Match.first.search.user.fname
          }
        ],

          'Subject'=> 'Your Request is declined :(!',
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
end
