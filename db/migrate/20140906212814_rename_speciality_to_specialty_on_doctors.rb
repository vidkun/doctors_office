class RenameSpecialityToSpecialtyOnDoctors < ActiveRecord::Migration
  def change
    rename_column :doctors, :speciality, :specialty
  end
end
