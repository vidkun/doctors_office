class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :patient_name
      t.string :phone_number
      t.string :email
      t.datetime :start_time
      t.datetime :end_time
      t.text :reason
      t.belongs_to :doctor, index: true

      t.timestamps
    end
  end
end
