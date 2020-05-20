Sequel.migration do

  COLLECTION_CODES = %w(GL HSL NCC NCCPA PA SFC SHC TEST UA)

  up do
    $stderr.puts("Adding accession_collection_code enumeration...")
    self[:enumeration].insert(name: 'accession_collection_code',
                              json_schema_version: 1,
                              create_time: Time.now,
                              system_mtime: Time.now,
                              user_mtime: Time.now,
                              created_by: 'admin',
                              last_modified_by: 'admin')
    enumeration_id = self[:enumeration].order(:create_time).last[:id]

    $stderr.puts("Adding enumeration_values for accession_collection_code enumeration...")
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

    $stderr.puts("Updating id_0_id on accessions...")
    self[:accession].all.each do |row|
      id_0 = row[:identifier].match(/\[\"([A-Z]+)\",/).captures[0]
      enum_val_id = self[:enumeration_value].where(enumeration_id: enumeration_id, value: id_0).first[:id]
      accession_id = row[:id]

      self[:accession].where(id: accession_id).update(id_0_id: enum_val_id,
                                                      system_mtime: Time.now,
                                                      user_mtime: Time.now,
                                                      last_modified_by: 'admin')
    end
  end

  down do
  end

end