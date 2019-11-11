require_relative 'mixins/accession_identifier'

Accession.class_eval do
  include AccessionIdentifier
end
