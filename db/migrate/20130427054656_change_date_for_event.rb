class ChangeDateForEvent < ActiveRecord::Migration
  change_table :events do |t|
    t.change :date, :date
  end
end
