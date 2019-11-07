Sequel.migration do

  up do
    alter_table(:accession) do
      add_column :id_0_id, Integer
    end
  end


  down do
    alter_table(:accession) do
      drop_column :id_0_id
    end
  end

end

