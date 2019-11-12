class IndexerCommon
  self.add_indexer_initialize_hook do |indexer|
    # Index new id_0 enum field
    indexer.add_document_prepare_hook {|doc, record|
      doc['id_0_enum_s'] ||= []
      doc['id_0_enum_s'] << record['record'].fetch('id_0_enum_s')
    }
  end
end