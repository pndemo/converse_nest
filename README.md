# Converse Nest

<a href="https://www.codacy.com/app/pndemo/converse_nest?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=pndemo/converse_nest&amp;utm_campaign=Badge_Grade">
<img class="notice-badge" src="https://api.codacy.com/project/badge/Grade/1512eaed87c44b8794ca3aae2154c76b" alt="Badge"/>
</a>
<a href="https://travis-ci.org/pndemo/converse_nest">
<img class="notice-badge" src="https://travis-ci.org/pndemo/converse_nest.svg?branch=master" alt="Badge"/>
</a>
<a href="https://coveralls.io/github/pndemo/converse_nest">
<img class="notice-badge" src="https://coveralls.io/repos/github/pndemo/converse_nest/badge.svg?branch=master&service=github" alt="Badge"/>
</a>
<a href="https://github.com/pndemo/converse_nest/blob/develop/License.md">
<img class="notice-badge" src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="Badge"/>
</a>

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

### Sign Up module

Endpoint | Functionality | Access
------------ | ------------- | -------------
POST /signup | Create a new user account | PUBLIC

### Authentication module

Endpoint | Functionality | Access
------------ | ------------- | -------------
POST /auth/login | Login a registered user | PUBLIC

### Posts module

Endpoint | Functionality | Access
------------ | ------------- | -------------
GET /posts | Get all blog posts | PRIVATE
POST /posts | Create a new blog post | PRIVATE
PUT /posts/:id | Update an existing blog post | PRIVATE
DELETE /posts/:id | Delete an existing blog post | PRIVATE

### Comments module

Endpoint | Functionality | Access
------------ | ------------- | -------------
GET /posts/:post_id/comments | Get all post comments | PRIVATE
POST /posts/:post_id/comments | Create a new post comment | PRIVATE
PUT /posts/:post_id/comments/:id | Update an existing post comment | PRIVATE
DELETE /posts/:post_id/comments/:id | Delete an existing post comment | PRIVATE

## Testing the App

Install [httpie](https://httpie.org/) on your computer and make tests using the format below. Please note that the same testing format applies to the comments module.

#### GET /signup
```shell
http localhost:3000/signup name='Paul' email='paul@mail.com' password='strong' password_confirmation='strong'
```

#### GET /auth/login
```shell
http localhost:3000/auth/login email='paul@mail.com' password='strong'
```

#### GET /posts
```shell
http localhost:3000/posts \
Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTEwMjEzMTF9.sf1lsNjEMFUMBfUJvZdquDx60aib-1ngMFAi6E9PC-8'
```

#### POST /posts
```shell
http POST localhost:3000/posts title='My Weekend' content='It was so awesome' created_by='Paul' \
Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTEwMjEzMTF9.sf1lsNjEMFUMBfUJvZdquDx60aib-1ngMFAi6E9PC-8'
```

#### PUT /posts/:id
```shell
http PUT localhost:3000/posts/1 title='My Best Weekend' \
Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTEwMjEzMTF9.sf1lsNjEMFUMBfUJvZdquDx60aib-1ngMFAi6E9PC-8'
```

#### DELETE /posts/:id
```shell
http DELETE localhost:3000/posts/1 \
Authorization:'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTEwMjEzMTF9.sf1lsNjEMFUMBfUJvZdquDx60aib-1ngMFAi6E9PC-8'
```

#### GET, POST, PUT & DELETE comment(s)
The syntax is similar getting, posting, updating and deleting posts as illustrated above.

## Next Steps

While this app provides simple micro-blogging functionalities of registering, authenticating, adding posts and comments, the next steps are to improve data validation and user management by enabling users to edit their information, change their password and control accessability of blog posts they posted by them.

## Licensing
This app is licensed under the MIT license.
