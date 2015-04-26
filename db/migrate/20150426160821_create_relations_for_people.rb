class CreateRelationsForPeople < ActiveRecord::Migration
  def change
    create_table :vssc_contacts_people, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :person, index: true
    end
    
  end
end
