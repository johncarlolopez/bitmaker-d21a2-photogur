![Bitmaker](https://github.com/johncarlolopez/bitmaker-reference/blob/master/bitmakerlogo.svg)

![Preview](https://github.com/johncarlolopez/bitmaker-d21a2-photogur/blob/master/example.png)

See assignment in Alexa: https://alexa.bitmaker.co/wdi/67/assignments/2035/latest

# 03 - Photogur ActiveRecord Queries (Part 2)
### Friday, Jan 12th

## Using ActiveRecord Queries in Photogur
___
If you find yourself using the same code over and over again to select records, you’ll want to save those queries as methods in your model.
```
class Picture < ActiveRecord::Base

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

end
```
Then you can use them in your controllers and views.

pictures_controller.rb:
```
class PicturesController < ApplicationController
  def index
    @most_recent_pictures = Picture.most_recent_five
  end
  .
  .
  .
end
```
app/views/pictures/index.html.erb:
```
[...]

<h1>Most recent pictures</h1>
<ul>
  <% @most_recent_pictures.each do |picture| %>
    <li><%= picture.title %></li>
  <% end %>
</ul>

[...]
```
## Your challenge
____

1. Try listing all the pictures more than 1 month old on your index page below your previous work, as well as the total number of those pictures. These sections of the rails guides may be helpful. Keep in mind, you'll actually need a couple pictures that have a created_at date at least a month old, so find a way to update at least one of your picture's created_at date to some time from at least a month ago.

2. Add a new method pictures_created_in_year to Picture that accepts a year as an argument and returns all pictures whose created_at falls within that calendar year. Add sections for each year to your index and display the corresponding pictures in each section.
