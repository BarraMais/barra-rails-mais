# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170509145040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.integer  "accessory_type"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ad_interests", force: :cascade do |t|
    t.integer  "ad_id"
    t.integer  "interest_area_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["ad_id"], name: "index_ad_interests_on_ad_id", using: :btree
    t.index ["interest_area_id"], name: "index_ad_interests_on_interest_area_id", using: :btree
  end

  create_table "address_relations", force: :cascade do |t|
    t.integer  "advertiser_id"
    t.integer  "address_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["address_id"], name: "index_address_relations_on_address_id", using: :btree
    t.index ["advertiser_id"], name: "index_address_relations_on_advertiser_id", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "complement"
    t.string   "neighborhood"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "zip_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
    t.index ["state_id"], name: "index_addresses_on_state_id", using: :btree
  end

  create_table "ads", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "area"
    t.integer  "interest_area_id"
    t.index ["interest_area_id"], name: "index_ads_on_interest_area_id", using: :btree
  end

  create_table "advertisers", force: :cascade do |t|
    t.integer  "document_type"
    t.string   "document_number"
    t.string   "email"
    t.string   "website"
    t.string   "facebook"
    t.string   "instagram"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "landline"
    t.string   "cell_phone"
    t.integer  "address_id"
    t.index ["address_id"], name: "index_advertisers_on_address_id", using: :btree
    t.index ["user_id"], name: "index_advertisers_on_user_id", using: :btree
  end

  create_table "album_photos", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["user_id"], name: "index_album_photos_on_user_id", using: :btree
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_id"], name: "index_areas_on_ad_id", using: :btree
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "vessel_type_id"
    t.index ["vessel_type_id"], name: "index_brands_on_vessel_type_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "classifieds", force: :cascade do |t|
    t.string   "title"
    t.integer  "document_type"
    t.string   "seller_name"
    t.string   "email"
    t.string   "landline"
    t.string   "cell_phone"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.string   "document_number"
    t.boolean  "bonded"
    t.string   "photo_a_file_name"
    t.string   "photo_a_content_type"
    t.integer  "photo_a_file_size"
    t.datetime "photo_a_updated_at"
    t.string   "photo_b_file_name"
    t.string   "photo_b_content_type"
    t.integer  "photo_b_file_size"
    t.datetime "photo_b_updated_at"
    t.integer  "classified_conditional"
    t.index ["user_id"], name: "index_classifieds_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipient_id", "sender_id"], name: "index_conversations_on_recipient_id_and_sender_id", unique: true, using: :btree
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_conversations_on_sender_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_for_travels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_guests", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
    t.index ["event_id"], name: "index_event_guests_on_event_id", using: :btree
    t.index ["guest_id", "event_id"], name: "index_event_guests_on_guest_id_and_event_id", unique: true, using: :btree
    t.index ["guest_id"], name: "index_event_guests_on_guest_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "event_date"
    t.integer  "address_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.text     "about"
    t.index ["address_id"], name: "index_events_on_address_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "fishing_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fishing_sub_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "fishing_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["fishing_category_id"], name: "index_fishing_sub_categories_on_fishing_category_id", using: :btree
  end

  create_table "fishings", force: :cascade do |t|
    t.integer  "status"
    t.integer  "classified_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "fishing_sub_category_id"
    t.string   "provisional_category"
    t.integer  "fishing_category_id"
    t.index ["classified_id"], name: "index_fishings_on_classified_id", using: :btree
    t.index ["fishing_category_id"], name: "index_fishings_on_fishing_category_id", using: :btree
    t.index ["fishing_sub_category_id"], name: "index_fishings_on_fishing_sub_category_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_members", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
    t.integer  "who_started"
    t.index ["group_id"], name: "index_group_members_on_group_id", using: :btree
    t.index ["member_id"], name: "index_group_members_on_member_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "about"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "interest_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "molds", force: :cascade do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_molds_on_brand_id", using: :btree
  end

  create_table "nautical_sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "target_type",     null: false
    t.integer  "target_id",       null: false
    t.string   "notifiable_type", null: false
    t.integer  "notifiable_id",   null: false
    t.string   "key",             null: false
    t.string   "group_type"
    t.integer  "group_id"
    t.integer  "group_owner_id"
    t.string   "notifier_type"
    t.integer  "notifier_id"
    t.text     "parameters"
    t.datetime "opened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id", using: :btree
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id", using: :btree
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id", using: :btree
  end

  create_table "own_vessels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vessel_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id", "vessel_type_id"], name: "index_own_vessels_on_user_id_and_vessel_type_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_own_vessels_on_user_id", using: :btree
    t.index ["vessel_type_id"], name: "index_own_vessels_on_vessel_type_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_images", force: :cascade do |t|
    t.integer  "post_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["post_id"], name: "index_post_images_on_post_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.integer  "domain",                  default: 0
    t.integer  "domain_id"
    t.json     "rich_url"
    t.index ["cached_votes_down"], name: "index_posts_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_posts_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_posts_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_posts_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_sub_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["product_category_id"], name: "index_product_sub_categories_on_product_category_id", using: :btree
  end

  create_table "product_sub_category2s", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_sub_category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["product_sub_category_id"], name: "index_product_sub_category2s_on_product_sub_category_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "classified_id"
    t.integer  "status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "product_category_id"
    t.integer  "product_sub_category_id"
    t.integer  "product_sub_category2_id"
    t.index ["classified_id"], name: "index_products_on_classified_id", using: :btree
    t.index ["product_category_id"], name: "index_products_on_product_category_id", using: :btree
    t.index ["product_sub_category2_id"], name: "index_products_on_product_sub_category2_id", using: :btree
    t.index ["product_sub_category_id"], name: "index_products_on_product_sub_category_id", using: :btree
  end

  create_table "state_for_travels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "uf"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "target_type",                             null: false
    t.integer  "target_id",                               null: false
    t.string   "key",                                     null: false
    t.boolean  "subscribing",              default: true, null: false
    t.boolean  "subscribing_to_email",     default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text     "optional_targets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_subscriptions_on_key", using: :btree
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true, using: :btree
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "advertiser_id"
    t.integer  "ad_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ad_id"], name: "index_transactions_on_ad_id", using: :btree
    t.index ["advertiser_id"], name: "index_transactions_on_advertiser_id", using: :btree
  end

  create_table "traveled_countries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "country_for_travel_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["country_for_travel_id"], name: "index_traveled_countries_on_country_for_travel_id", using: :btree
    t.index ["user_id"], name: "index_traveled_countries_on_user_id", using: :btree
  end

  create_table "traveled_states", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "state_for_travel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["state_for_travel_id"], name: "index_traveled_states_on_state_for_travel_id", using: :btree
    t.index ["user_id"], name: "index_traveled_states_on_user_id", using: :btree
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["interest_id"], name: "index_user_interests_on_interest_id", using: :btree
    t.index ["user_id"], name: "index_user_interests_on_user_id", using: :btree
  end

  create_table "user_nautical_sports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "nautical_sport_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["nautical_sport_id"], name: "index_user_nautical_sports_on_nautical_sport_id", using: :btree
    t.index ["user_id"], name: "index_user_nautical_sports_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cellphone"
    t.date     "birthday"
    t.string   "sex"
    t.integer  "nautical_professional"
    t.text     "academic_profile"
    t.integer  "relationship"
    t.integer  "partner_id"
    t.text     "about"
    t.integer  "has_embarcation"
    t.text     "nautical_profession_description"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "email",                           default: "", null: false
    t.string   "encrypted_password",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "nautical_license"
    t.integer  "has_nautical_license"
    t.integer  "naval_service"
    t.integer  "naval_service_patent"
    t.string   "work"
    t.integer  "license_interest"
    t.integer  "fishing",                         default: 0
    t.integer  "nautical_tour",                   default: 0
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.string   "nickname"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "website"
    t.string   "profession"
    t.string   "mobile_operator"
    t.string   "alternative_email"
    t.text     "language"
    t.text     "nautical_literature"
    t.text     "nautical_application"
    t.text     "nautical_brand"
    t.text     "cruise_trips"
    t.boolean  "water_sportsman"
    t.integer  "fishing_type"
    t.text     "tourist_places"
    t.boolean  "fishing_tourist"
    t.integer  "water_sport"
    t.text     "national_trips"
    t.text     "international_trips"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["partner_id"], name: "index_users_on_partner_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vessel_accessories", force: :cascade do |t|
    t.integer  "vessel_id"
    t.integer  "accessory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["accessory_id"], name: "index_vessel_accessories_on_accessory_id", using: :btree
    t.index ["vessel_id"], name: "index_vessel_accessories_on_vessel_id", using: :btree
  end

  create_table "vessel_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "vessels", force: :cascade do |t|
    t.integer  "status"
    t.string   "manufacturation_year"
    t.string   "activation_year"
    t.boolean  "alienated"
    t.string   "chassis_number"
    t.integer  "classified_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "mold_id"
    t.integer  "brand_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "vessel_type_id"
    t.index ["brand_id"], name: "index_vessels_on_brand_id", using: :btree
    t.index ["classified_id"], name: "index_vessels_on_classified_id", using: :btree
    t.index ["mold_id"], name: "index_vessels_on_mold_id", using: :btree
    t.index ["vessel_type_id"], name: "index_vessels_on_vessel_type_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "ad_interests", "ads"
  add_foreign_key "ad_interests", "interest_areas"
  add_foreign_key "address_relations", "addresses"
  add_foreign_key "address_relations", "advertisers"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "states"
  add_foreign_key "ads", "interest_areas"
  add_foreign_key "advertisers", "addresses"
  add_foreign_key "advertisers", "users"
  add_foreign_key "album_photos", "users"
  add_foreign_key "areas", "ads"
  add_foreign_key "brands", "vessel_types"
  add_foreign_key "cities", "states"
  add_foreign_key "classifieds", "users"
  add_foreign_key "conversations", "users", column: "recipient_id"
  add_foreign_key "conversations", "users", column: "sender_id"
  add_foreign_key "event_guests", "events"
  add_foreign_key "event_guests", "users", column: "guest_id"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "users"
  add_foreign_key "fishing_sub_categories", "fishing_categories"
  add_foreign_key "fishings", "classifieds"
  add_foreign_key "fishings", "fishing_categories"
  add_foreign_key "fishings", "fishing_sub_categories"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users", column: "member_id"
  add_foreign_key "groups", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "molds", "brands"
  add_foreign_key "own_vessels", "users"
  add_foreign_key "own_vessels", "vessel_types"
  add_foreign_key "post_images", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "product_sub_categories", "product_categories"
  add_foreign_key "product_sub_category2s", "product_sub_categories"
  add_foreign_key "products", "classifieds"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_sub_categories"
  add_foreign_key "products", "product_sub_category2s"
  add_foreign_key "states", "countries"
  add_foreign_key "transactions", "ads"
  add_foreign_key "transactions", "advertisers"
  add_foreign_key "traveled_countries", "country_for_travels"
  add_foreign_key "traveled_countries", "users"
  add_foreign_key "traveled_states", "state_for_travels"
  add_foreign_key "traveled_states", "users"
  add_foreign_key "user_interests", "interests"
  add_foreign_key "user_interests", "users"
  add_foreign_key "user_nautical_sports", "nautical_sports"
  add_foreign_key "user_nautical_sports", "users"
  add_foreign_key "users", "users", column: "partner_id"
  add_foreign_key "vessel_accessories", "accessories"
  add_foreign_key "vessel_accessories", "vessels"
  add_foreign_key "vessels", "brands"
  add_foreign_key "vessels", "classifieds"
  add_foreign_key "vessels", "molds"
  add_foreign_key "vessels", "vessel_types"
end
