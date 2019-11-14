module AccessionIdentifier

  def self.included(base)
    base.extend(ClassMethods)
  end

  def update_from_json(json, *other_args)
    # Update identifier in db from id_0 in json
    @id_0 = json[:id_0]

    super
  end

  module ClassMethods
    def create_from_json(json, opts={})
      # Can't add to Accession.properties_to_auto_generate because needs to happen before identifier is set below
      json[:id_1] = auto_generate_id_1

      # Kinda clunky way of forcing identifier in db to get set from id_0
      # Otherwise, bc id_0 is not a dynamic_enum in schema, id_0 from json just gets sent to id_0_id
      # Can't use auto_generator because identifier isn't on accession schema
      opts.merge!(identifier: JSON([json[:id_0], json[:id_1], json[:id_2], json[:id_3]]))

      super
    end

    def auto_generate_id_1
      date = Time.now.getlocal('-05:00').strftime('%Y%m%d')
      sequence_val = Sequence.get("GENERATE_ACCESSION_IDENTIFIER_#{date}")

      "#{date}.#{sequence_val + 1}"
    end
  end

end