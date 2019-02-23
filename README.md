# Converse Nest

Converse Nest is a simple micro-blogging based API. It's simple to integrate and fun to use!!!

## Install

### Clone the repository

```shell
https://github.com/pndemo/converse_nest.git
cd converse_nest
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate
```

### Serve

```shell
rails s
```

## API Endpoints

### Posts module

Endpoint | Functionality
------------ | -------------
GET /posts | Get all blog posts
POST /posts | Create a new blog post
PUT /posts/:id | Update an existing blog post
DELETE /posts/:id | Delete an existing blog post

### Comments module

Endpoint | Functionality
------------ | -------------
GET /posts/:post_id/comments | Get all post comments
POST /posts/:post_id/comments | Create a new post comment
PUT /posts/:post_id/comments/:id | Update an existing post comment
DELETE /posts/:post_id/comments/:id | Delete an existing post comment

## Testing the App

Install [httpie](https://httpie.org/) on your computer and make tests using the format below. Please note that the same testing format applies to the comments module.

#### GET /posts
```shell
http :3000/posts
```

#### POST /posts
```shell
http POST :3000/posts title='My Weekend' content='It was so awesome' created_by='Paul'
```

#### PUT /posts/:id
```shell
http PUT :3000/posts/1 title='My Best Weekend'
```

#### DELETE /posts/:id
```shell
http DELETE :3000/posts/1
```

## Next Steps

While this app provides simple micro-blogging functionalities of adding posts and comments, the next steps are to improve it by adding authentication and user management functionalities.

## Licensing
This app is licensed under the MIT license.
