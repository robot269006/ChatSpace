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
  ### 3. Messages(chat/thread)
  ### 4. Images
  ### 5. Comments(chat itself)

  # Relation
  ## 1. User
    ### belongs_to :user-group
    ### has_many :groups, :messages, :images, :comments
  ## 2. Group
    ### belongs_to :user-group
    ### has_many :users, :messages
  ## 3. Messages(chat/thread)
    ### belongs_to :user, :group
    ### has_many :comments, :images,
  ## 4. Images
    ### belongs_to :user, :message
    ### has_many :none
  ## 5. Comments(chat itself)
    ### belongs_to :user, :message
    ### has_many :none
  ## 2.5 User-Group(Mid-table)
    ### belongs_to :none
    ### has_many :user, :group

  # Tables
  ## 1. User
   | Column        | Type        |
   |:--|:--|
   | id            |     integer |
   | name          |        text |
   | body          |        text |
   | e-mail        |        text |
   | password      |        text |
   | created_at    |      string |
   | updated_at    |      string |
   | user-group id |      string |

  ## 2. Group
   | Column        | Type        |
   |:--|:--|
   | id            |     integer |
   | groupname     |        text |
   | body          |        text |
   | password      |        text |
   | created_at    |      string |
   | updated_at    |      string |
   | user-group id |      string |

  ## 3. Messages
   | Column        | Type        |
   |:--|:--|
   | id            |     integer |
   | threadname    |        text |
   | body          |        text |
   | created_at    |      string |
   | updated_at    |      string |
   | user_id       |      string |
   | group_id      |      string |

  ## 4. Images
   | Column        | Type        |
   |:--|:--|
   | id            |     integer |
   | imagetitle    |        text |
   | imagefile     |      string |
   | created_at    |      string |
   | updated_at    |      string |
   | user_id       |      string |
   | message_id    |      string |

  ## 5. Comments
   | Column        | Type        |
   |:--|:--|
   | id            |     integer |
   | commenttitle  |        text |
   | body          |        text |
   | created_at    |      string |
   | updated_at    |      string |
   | user_id       |      string |
   | message_id    |      string |


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
