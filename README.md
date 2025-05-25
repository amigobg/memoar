# Memoar

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/memoar`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add memoar
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install memoar
```

## Usage

```bash
class Article < ApplicationRecord
  track_changes_to :title, :content
end

```
```bash
article.version_log
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amigobg/memoar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/memoar/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).