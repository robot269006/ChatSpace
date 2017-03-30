== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  Ruby version: 2.3.1
  RoR version:  ~5.0.0, => 5.0.0.1

* System dependencies

* Configuration

* Database creation
  # Overview
  ### DB-name: chat-space
  ### DB-aim:  DB for chat-space

  # Functions
  ### 1. New user registration
  ### 2. Chat (1on1)
  ### 3. Group-chat
  ### 4. Search other user profile
  ### 5. Group invitation
  ### 6. Chat history
  ### 7. Send/Receive images
  ### 8. Auto-refresh chat conversations

  # Entity
  ### 1. User
  ### 2. Group
  ### 3. Messages

  # Relation
  ## 1. User
    ### belongs_to :none
    ### has_many :messages, :group_user
    ### has_many :groups, through: group_user
  ## 2. Group
    ### belongs_to :none
    ### has_many :messages, :group_user
    ### has_many :users, through: group_user
  ## 3. Messages
    ### belongs_to :user, :group
    ### has_many :none
  ## 1.5 Group_user(Mid-table)
    ### belongs_to :user, :group
    ### has_many :none

  # Tables
  ## 1. User (* Via use of "devise" gem)
   | Column        | Type        | Settings        |
   |:--|:--|:--|
   | name          |        text |         not null|
   | body          |        text |                 |
   | e-mail        |        text |         not null|
   | password      |        text |         not null|
   | group_user id |     integer |  ref:foreign_key|

  ## 2. Group
   | Column        | Type        | Settings        |
   |:--|:--|:--|
   | name          |        text |         not null|
   | body          |        text |                 |
   | group_user id |     integer |  ref:foreign_key|

  ## 3. Messages
   | Column        | Type        | Settings        |
   |:--|:--|:--|
   | title         |        text |         not null|
   | body          |        text |                 |
   | imagefile     |      string |                 |
   | user_id       |     integer |  ref:foreign_key|
   | group_id      |     integer |  ref:foreign_key|

  ## 1.5. Group_user
   | Column        | Type        | Settings        |
   |:--|:--|:--|
   | user_id       |     integer |  ref:foreign_key|
   | group_id      |     integer |  ref:foreign_key|


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
