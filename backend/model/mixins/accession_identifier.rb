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
      # Kinda clunky way of forcing identifier in db to get set from id_0
      # Otherwise, bc id_0 is not a dynamic_enum in schema, id_0 from json just gets sent to id_0_id
      opts.merge!(identifier: JSON([json[:id_0], json[:id_1], json[:id_2], json[:id_3]]))

      super
    end
  end

end