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
  ### 3. Messages(chat/thread as whole)
  ### 4. Comments(chat/image itself)

  # Relation
  ## 1. User
    ### belongs_to :none
    ### has_many :messages, :comments
    ### has_many :groups, through: user_group
  ## 2. Group
    ### belongs_to :none
    ### has_many :messages
    ### has_many :users, through: user_group
  ## 3. Messages(chat/thread as whole)
    ### belongs_to :user, :group
    ### has_many :comments
  ## 4. Comments(chat/image itself)
    ### belongs_to :user, :message
    ### has_many :none
  ## 2.5 User_Group(Mid-table)
    ### belongs_to :user, :group
    ### has_many :none

  # Tables
  ## 1. User
   | Column        | Type        |
   |:--|:--|
   | name          |        text |
   | body          |        text |
   | e-mail        |        text |
   | password      |        text |
   | user-group id |     integer |

  ## 2. Group
   | Column        | Type        |
   |:--|:--|
   | groupname     |        text |
   | body          |        text |
   | password      |        text |
   | user-group id |     integer |

  ## 3. Messages
   | Column        | Type        |
   |:--|:--|
   | threadname    |        text |
   | body          |        text |
   | user_id       |     integer |
   | group_id      |     integer |

  ## 4. Comments
   | Column        | Type        |
   |:--|:--|
   | commenttitle  |        text |
   | body          |        text |
   | imagefile     |      string |
   | user_id       |     integer |
   | message_id    |     integer |

  ## 2.5. User_group
   | Column        | Type        |
   |:--|:--|
   | user_id       |     integer |
   | group_id      |     integer |


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
