# Cloudinary

## _What is it?_

Cloudinary is an image and video management system in the cloud.  It includes:

- Storage
- Upload
- "Powerful Administration"
- Image Manipulation
- A fast CDN

It is used by companies like Gizmodo, GQ, Answers, Redbull, Ebay etc.

See [here](http://cloudinary.com/) for more.

It's also quite simple to set up so let's get that going.

## How to get it up and running

First things first, sign up for an account [here.](https://cloudinary.com/users/register/free)

- Let's set up a new rails project - making sure to start it off with postgresql (just as a habit) - ` rails new cloudinary-test -d postgresql `
- We will use some Rails generators to make all our migrations etc. - ` rails generate model Animal name:string image:string `
- We then need to run ` rake db:create ` and ` rake db:migrate `
- We need to add ` gem 'cloudinary' ` to our Gemfile
- Then we need to run ` bundle `
- Because Cloudinary is an API, we need to identify ourselves with it. Luckily they have a file that we can download that will do this for us - go [here](http://cloudinary.com/console/cloudinary.yml) (if it doesn't do anything, make sure you are logged in).
    + This will download a file called ` cloudinary.yml ` - we need to save that in the config folder.  This will be run everytime your server gets run
- Let's change our Routes ...

    ```
    Rails.application.routes.draw do
      root 'animals#index'
      get 'animals/new'
      post 'animals' => 'animals#create'
    end
    ```

- Let's create some views for us to work with - ` rails g controller Animals index new `

    ```
    def index
        @animals = Animal.all
    end

    def new
        @animal = Animal.new
    end
    ```

- And then make those views
- ` new.html.erb `
    ```
    <%= form_tag @animal, url: "/animals", multipart: true do %>
      <%= label_tag "Animal Name: " %>
      <%= text_field_tag :name %>

      <br />
      <br />
      <%= label_tag "Animal Image: " %>
      <%= cl_image_upload_tag :avatar %>

      <br />
      <br />
      <%= submit_tag "Create Animal." %>
    <% end %>
    ```

- In this form, we have said that we are posting it to /animals, so we need to make sure our routes have something for that - ` post 'animals' => 'animals#create' `
- In our create method, it should look something like this:

    ```
    req = Cloudinary::Uploader.upload( params[:file] )
    @animal = Animal.create( name: params[:name], avatar: req["url"] )
    ```

- We have an error, and that is because we haven't given Cloudinary the appropriate details
- Add this into the head tag of your application.html.erb - ` <%= cloudinary_js_config %> `.  This will append your form with a bunch of cloudinary related configuration things.