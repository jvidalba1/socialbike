class AddInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id

      t.timestamps
    end
  end

end
