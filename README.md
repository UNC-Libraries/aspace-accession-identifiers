This plugin adds automatic identifier generation to the "Create
Accession" form.  

The second component will be pre-filled as:

  YYYYMMDD.N

Where YYYYMMDD is the current date, and N is a sequence number starting with 1.

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     AppConfig[:plugins] = ['generate_accession_identifiers']
