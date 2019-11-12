require 'time'

class ArchivesSpaceService < Sinatra::Base

  Endpoint.post('/plugins/generate_accession_identifiers/next')
    .description("Generate a new identifier based on the date and a running number")
    .params()
    .permissions([])
    .returns([200, "{'number', N}"]) \
  do
    date = Time.now.getlocal('-05:00').strftime('%Y%m%d')
    sequence_val = Sequence.get("GENERATE_ACCESSION_IDENTIFIER_#{date}")
    number = "#{date}.#{sequence_val + 1}"

    json_response(:number => number)
  end

end
