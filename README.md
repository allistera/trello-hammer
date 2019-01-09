# Trello::Hammer

Loops around each Card within a Trello Board and either:

* Deletes the Card if it is older than 60 days.
* Comments on the Card saying it will be deleted tomorrow if card is 59 days old. 

Ideal for automatically cleaning out that ever-growing Backlog.

## Usage

`bundle exec ./bin/trello-hammer clean [TRELLO_KEY] [TRELLO_TOKEN] [BOARD_ID]`
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trello-hammer.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
