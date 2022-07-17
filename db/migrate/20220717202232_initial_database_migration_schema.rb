class InitialDatabaseMigrationSchema < ActiveRecord::Migration[5.1]
  def up
    create_table "bookmarks" do |t|
      t.integer "post_id"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["post_id"], name: "index_bookmarks_on_post_id"
      t.index ["user_id"], name: "index_bookmarks_on_user_id"
    end
    create_table "comments" do |t|
      t.text "content"
      t.integer "post_id"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["post_id"], name: "index_comments_on_post_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end
    create_table "likes" do |t|
      t.integer "post_id"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["post_id"], name: "index_likes_on_post_id"
      t.index ["user_id"], name: "index_likes_on_user_id"
    end
    create_table "photos" do |t|
      t.string "image"
      t.integer "post_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["post_id"], name: "index_photos_on_post_id"
    end
    create_table "posts" do |t|
      t.string "content"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_posts_on_user_id"
    end
    create_table "users" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip"
      t.string "last_sign_in_ip"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "name"
      t.string "provider"
      t.string "uid"
      t.string "image"
      t.string "website"
      t.text "bio"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
    create_table 'follows' do |t|
      t.integer 'following_id', null: false
      t.integer 'follower_id', null: false

      t.timestamps null: false

      t.index ["following_id"], name: "index_follows_on_following_id"
      t.index ["follower_id"], name: "index_follows_on_follower_id"
      t.index ["following_id", "follower_id"], name: "index_follows_on_following_id_and_follower_id", unique: true
    end
    create_table :hash_tags do |t|
      t.string :name

      t.timestamps
    end
    create_table :post_hash_tags do |t|
      t.belongs_to :post, index: true
      t.belongs_to :hash_tag, index: true

      t.timestamps
    end
    create_table :conversations do |t|
      t.integer :author_id
      t.integer :receiver_id

      t.timestamps

      t.index ["author_id"], name: "index_conversations_on_author_id"
      t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
      t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    end
    create_table :personal_messages do |t|
      t.text :body
      t.belongs_to :conversation, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
