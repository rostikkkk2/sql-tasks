# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_26_133147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_countries_on_region_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.integer "manager_id"
    t.bigint "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_departments_on_location_id"
    t.index ["manager_id"], name: "index_departments_on_manager_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number", limit: 20
    t.datetime "hire_date", null: false
    t.float "salary"
    t.integer "commission_pct"
    t.integer "manager_id"
    t.bigint "job_id", null: false
    t.bigint "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["job_id"], name: "index_employees_on_job_id"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "job_histories", force: :cascade do |t|
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.bigint "employee_id", null: false
    t.bigint "job_id", null: false
    t.bigint "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_job_histories_on_department_id"
    t.index ["employee_id"], name: "index_job_histories_on_employee_id"
    t.index ["job_id"], name: "index_job_histories_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.float "min_salary"
    t.float "max_salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address", null: false
    t.string "postal_code", null: false
    t.string "city", null: false
    t.string "state_province", null: false
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_locations_on_country_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
