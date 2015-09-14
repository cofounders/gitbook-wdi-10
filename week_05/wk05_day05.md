## Week 05, Day 05
### 04 / 09 / 2015

What we covered today:
- Validations
- Authentication
- Authorisation
- Sessions
- Custom Helpers
- LolCommits
- Project Brief

#### Validations

As with virtually every problem in the universe, Active Record has a solution.  Instead of trying to create by hand validations for data that is getting submitted to a database, let us work with Active Record and find out whether it has the solution (and it will).

These validations go within the model that you are trying to validate against (for example user.rb).

##### Why should we use them?

Because the internet is a scary, scary world and there are scary, scary things that people will try and put in your database.

##### When do validations take place?

Validations occur when any of the following methods take place:

- create
- create!
- save
- save!
- update
- update!

If you want to skip validations, they won't take place when using the following methods.

- decrement!
- decrement_counter
- increment!
- increment_counter
- toggle!
- touch
- update_all
- update_attribute
- update_column
- update_columns
- update_counters

You can also pass ` :validate => false ` to the save method.

##### How to test validity?

There are methods!

- valid?
- invalid?

If a model is invalid, you can access the errors easily as well.  That is in the ` .errors.messages `.

##### Alright, enough of this.  Now for some Validation Helpers

```rb
class User < ActiveRecord::Base
  has_many :books
  validates :column_name, :key => value
end
```

###### acceptance

This method validates that a checkbox on the user interface was checked when a form was submitted.  This is how terms of service are accepted for example.

```rb
validates :terms_of_service, acceptance: true

# It defaults to "1", if you want to accept something else

validates :terms_of_service, acceptance = { :accept => "yes" }
```

###### validates_associated

If you have associations, you can validate those associations by using validate associated.

```rb
validates_associated :column_name
```

Don't do this on both sides of the associations! It will cause an infinite loop.

###### confirmation

You should use this helper if you have two text fields that should receive exactly the same content.  This validation creates a virtual attribute whose name is the name of the field but with "_confirmation" at the end.

```rb
validates :email, :confirmation => true

# This should always work with a nil check as well

validates :email_confirmation, :presence => true
```

###### exclusion

This helper validates that the attributes' values are not included in a given set.  It requires an :in option that receives the set of values that cannot be included, as well as an optional :message option to show how you can include the attribute's value.

```rb
validates :subdomain, :exclusion => {
                        :in => [ "www", "us", "ca", "jp" ],
                        :message => "%{ value } is reserved. "
                      }

# Notice the interpolation with value, that takes the excluded value
```

###### format

This helper validates the attributes' values by testing whether they match a given regular expression, which is specified using the :with option.

```
validates :legacy_code, format: {
                          :with => /\A[a-zA-Z]+\z/,
                          :message => "only allows letters"
                        }
```

Alternatively, you can require that the specified attribute does not match the regular expression by using the :without option.

###### length

This helper validates the length of the attributes' values. It provides a variety of options, so you can specify length constraints in different ways:

```rb
validates :name, length: { minimum: 2 }
validates :bio, length: { maximum: 500 }
validates :password, length: { in: 6..20 }
validates :registration_number, length: { is: 6 }
```

###### numericality

This helper works with numericality.

```rb
validates :count, numericality: { :only_integer => true }
```

Besides :only_integer, you can also work with the following:

- :greater_than - Specifies the value must be greater than the supplied value. The default error message for this option is "must be greater than %{count}".
- :greater_than_or_equal_to - Specifies the value must be greater than or equal to the supplied value. The default error message for this option is "must be greater than or equal to %{count}".
- :equal_to - Specifies the value must be equal to the supplied value. The default error message for this option is "must be equal to %{count}".
- :less_than - Specifies the value must be less than the supplied value. The default error message for this option is "must be less than %{count}".
- :less_than_or_equal_to - Specifies the value must be less than or equal the supplied value. The default error message for this option is "must be less than or equal to %{count}".
- :odd - Specifies the value must be an odd number if set to true. The default error message for this option is "must be odd".
- :even - Specifies the value must be an even number if set to true. The default error message for this option is "must be even".

###### presence

Checks whether the value of a particular set of attributes is nil or an empty string.

```rb
validates :email, :presence => true
```

###### absence

Does the opposite or presence, makes sure it is not there.

```rb
validates :email, :absence => true
```

###### uniqueness

Makes sure there is only one of these columns with this particular value.

```rb
validates :email, uniqueness: true
```

##### Working with Validation Errors

Taking an invalid person as example...

```rb
person.valid? # Returns false

person.errors # Returns an instance of the class ActiveModel::Errors containing all errors. Each key is the attribute name and the value is an array of strings with all errors.

person.errors.messages # Returns all of the messages associated
```

There are plenty more ways to validate things, so see [here!](http://guides.rubyonrails.org/active_record_validations.html)

#### LolCommits

For some reason, people love this thing...  [See here.](https://github.com/mroth/lolcommits)

Run ` brew install imagemagick `.

Then run ` gem install lolcommits `.

To enable lolcommits within one git repo - ` lolcommits --enable `

If you would like this to apply to all git repos on your local computer, [see here.](https://github.com/mroth/lolcommits/wiki/Enabling-Lolcommits-for-all-your-Git-Repositories)