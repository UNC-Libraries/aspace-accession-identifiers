ArchivesSpace Accession Identifiers Plugin
===============

This plugin changes how accession identifiers are created in the "Create Accession" form.

### First component: 
This plugin adds an "Accession Collection Code" controlled value list.
In the Create/Edit Accession forms, staff can select a first identifier component from this dropdown list.

Staff with permission to edit controlled value lists can add and delete additional collection codes by selecting 
"Accession Collection Code" in the "Manage Controlled Value Lists" dropdown.

### Second component:
The second component will be auto-generated on record creation as:

  YYYYMMDD.N

Where YYYYMMDD is the current date, and N is a sequence number starting with 1.

Adapted from sample [generate_accession_identifiers](https://github.com/archivesspace/archivesspace/tree/master/plugins/generate_accession_identifiers) plugin from ArchivesSpace.

## Getting Started

Clone repository in ArchivesSpace plugins directory:

    $ cd /path/to/archivesspace/plugins
    $ git clone git@gitlab.lib.unc.edu:cappdev/aspace-accession-identifiers.git accession_identifiers

Enable the plugin by editing the file in `config/config.rb`:

    AppConfig[:plugins] = ['accession_identifiers']

(Make sure you uncomment this line.)

See also:

  https://github.com/archivesspace/archivesspace/blob/master/plugins/README.md

To add initial acccession collection code values, edit `COLLECTION_CODES` in the migration file: 
`migrations/002_add_accession_collection_code_enumeration.rb`. Alternatively, you can leave this blank 
and manage this list in the controlled value list of the staff UI.

You will need to restart archivesspace to enable config changes and migrate the database:

     $ cd /path/to/archivesspace
     $ sudo service.sh archivesspace stop
     $ sudo rm -rf data/indexer_pui_state
     $ sudo rm -rf data/indexer_state
     $ scripts/setup-database.sh
     $ sudo service.sh archivesspace start

See also:

  https://github.com/archivesspace/archivesspace/blob/master/UPGRADING.md

## Upgrading ASpace

When upgrading to future ASpace releases, check the following overridden files or methods for updated code:

- `frontend/app/helpers/aspace_form_helper.rb#label_and_fourpartid`
