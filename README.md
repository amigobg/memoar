# Memoar

Welcome to memoar! A simple versioning gem for ActiveRecord models using a JSON column.

## Installation

Add this line to your application's Gemfile:

```bash
gem 'memoar'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install memoar
```

## Usage

1. Generate a migration to add the version_log column to your model:

```bash
rails generate memoar:install ModelName
```

2. Run the migration:

```bash
rails db:migrate
```

3. In your ActiveRecord model, specify fields to track:

```bash
class Article < ApplicationRecord
  track_changes_to :title, :content
end
```
3.1 With limit of recorded changes (default 50):

```bash
class Article < ApplicationRecord
  track_changes_to :title, :content, limit: 10
end
```

```bash
article.previous_versions
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amigobg/memoar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/memoar/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).