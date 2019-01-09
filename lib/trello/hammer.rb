require 'trello/hammer/version'
require 'thor'
require 'trello'

module Trello
  module Hammer
    class CLI < Thor
      desc 'clean [TRELLO_KEY] [TRELLO_TOKEN] [BOARD_ID]', 'Deletes all Trello cards older than 60 days'
      def clean(key, token, board)
        Trello.configure do |config|
          config.developer_public_key = key
          config.member_token = token
        end

        Trello::Board.find(board).lists.each do |list|
          list.cards.each do |card|
            if card.last_activity_date < (Date.today - 60.days)
              puts "Deleting #{card.name}"
              card.delete
            elsif card.last_activity_date < (Date.today - 59.days)
              puts "Notifying #{card.name}"
              card.add_comment('Card scheduled for deletion tomorrow')
            end
          end
        end
      end
    end
  end
end
