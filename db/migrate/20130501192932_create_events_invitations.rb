class CreateEventsInvitations < ActiveRecord::Migration
  def change
    create_table :events_invitations, :id => false do |t|
      t.references :event
      t.references :invitation

    end
    add_index :events_invitations, :event_id
    add_index :events_invitations, :invitation_id
  end
end
