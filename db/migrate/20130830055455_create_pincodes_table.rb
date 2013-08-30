class CreatePincodesTable < ActiveRecord::Migration
  def change
    create_table :pincodes do |t|
      t.string 'office', :length => 255
      t.integer 'pincode'
      t.string 'office_type', :length => 255
      t.string 'delivery_status', :length => 255
      t.string 'division', :length => 255
      t.string 'region', :length => 255
      t.string 'circle', :length => 255
      t.string 'taluk', :length => 255
      t.string 'district', :length => 255
      t.string 'state', :length => 255
    end

    add_index :pincodes, :pincode
    add_index :pincodes, :state
    add_index :pincodes, :district
  end
end
