# Priscilla

Frock up your console messages. :dancer: :dancer: :dancer:

[![Build Status](https://travis-ci.org/Arkham/priscilla.png?branch=master)](https://travis-ci.org/Arkham/priscilla)
[![Code Climate](https://codeclimate.com/github/Arkham/priscilla.png)](https://codeclimate.com/github/Arkham/priscilla)
[![Coverage](https://codeclimate.com/github/Arkham/priscilla/coverage.png)](https://codeclimate.com/github/Arkham/priscilla)

## Why Priscilla

Because of [Priscilla, Queen of the Desert](http://en.wikipedia.org/wiki/The_Adventures_of_Priscilla,_Queen_of_the_Desert).

**Don't let your console messages drown in a wall of text, make them stand out!**

![Tutorial](images/priscilla.gif)

## Install

Add this line to your application's Gemfile:

```ruby
gem 'priscilla'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install priscilla
```

## Use

Require the gem:
```ruby
require 'priscilla'
```

Use `pr` to frock up your console messages

```ruby
pr "A cock in a frock on a rock"
```

Result

![Result](images/result.png)

## Decorators

Priscilla supports a lot of different decorators:

**Strings**

![Strings](images/strings.png)

**Colored Strings, [view all options](https://github.com/fazibear/colorize)**

![Colored Strings](images/colored_strings.png)
![Colored Strings, part 2](images/colored_strings_two.png)

**Unicode Emojis, [view all options](http://en.wikipedia.org/wiki/Emoji)**

![Unicode Emojis](images/unicode_emojis.png)

**Text Emojis, [view all options](http://www.emoji-cheat-sheet.com/)**

![Text Emojis](images/text_emojis.png)


## Configure

If you're using Rails, create an initializer in `config/initializers/priscilla.rb`:

```ruby
# This is the default configuration
Priscilla.configure do |c|
  c.width = 80
  c.decorator = ':dancer: '
  c.presenter = ->(msg) { puts msg; puts }
end
```

Or if you prefer to use the Rails logger:

```ruby
Priscilla.configure do |c|
  c.width = 80
  c.decorator = ':dancer: '
  c.presenter = ->(msg) { Rails.logger.debug "\n#{msg}" }
end
```

## Troubleshoot

**I can't see the fancy emojis!!! I'm on Linux!!!**

On Ubuntu: `sudo apt-get install ttf-ancient-fonts`

On Fedora: `yum install gdouros-symbola-fonts`

## Contribute

1. Fork it ( http://github.com/Arkham/priscilla/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
