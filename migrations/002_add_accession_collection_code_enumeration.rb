Sequel.migration do

  COLLECTION_CODES = %w(GL HSL NCC NCCPA PA SFC SHC TEST UA)

  up do
    # Add 'accession_collection code' enumeration
    self[:enumeration].insert(name: 'accession_collection_code',
                              create_time: Time.now,
                              system_mtime: Time.now,
                              user_mtime: Time.now,
                              created_by: 'admin',
                              last_modified_by: 'admin')
    enumeration_id = self[:enumeration].last[:id]

    # Add 'accession_collection code' enumeration values
    COLLECTION_CODES.each_with_index do |code, i|
      self[:enumeration_value].insert(value: code,
                                      enumeration_id: enumeration_id,
                                      readonly: 0,
                                      position: i,
                                      suppressed: 0,
                                      create_time: Time.now,
                                      system_mtime: Time.now,
                                      user_mtime: Time.now,
                                      created_by: 'admin',
                                      last_modified_by: 'admin')
    end

    # Link accessions to correct enumeration_value
    enum_val_ids = self[:enumeration_value].where(enumeration_id: enumeration_id).as_hash(:value, :id)

    self[:accession].all.each do |row|
      id_0 = row[:identifier].match(/\[\"([A-Z]+)\",/).captures[0]
      row.update(id_0_id: enum_val_ids[id_0],
                 system_mtime: Time.now,
                 user_mtime: Time.now,
                 last_modified_by: 'admin')
    end
  end

  down do
  end

end