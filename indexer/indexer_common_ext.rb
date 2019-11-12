class IndexerCommon
  self.add_indexer_initialize_hook do |indexer|
    # Hardcode id_0_enum_s field
    # https://github.com/archivesspace/archivesspace/blob/master/indexer/app/lib/indexer_common.rb#L258
    indexer.add_document_prepare_hook {|doc, record|
      found_keys = Set.new

      ASUtils.search_nested(record["record"], ['id_0'], ['_resolved']) do |field, field_value|
        key = "#{field}_enum_s"

        doc[key] ||= Set.new
        doc[key] << field_value

        found_keys << key
      end

      # Turn our sets back into regular arrays so they serialize out to JSON correctly
      found_keys.each do |key|
        doc[key] = doc[key].to_a
      end
    }
  end
end