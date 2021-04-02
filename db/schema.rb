
ActiveRecord::Schema.define(version: 2021_04_01_202253) do

  create_table "costumes", force: :cascade do |t|
    t.text "name"
    t.text "status"
    t.text "description"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.integer "age"
    t.string "email"
    t.string "password_digest"
    t.text "reviews"
  end

  add_foreign_key "costumes", "users"
end
