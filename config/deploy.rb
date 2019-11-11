set :application, "aspace-accession-identifiers"
set :repo_url, "git@gitlab.lib.unc.edu:cappdev/aspace-accession-identifiers.git"

set :deploy_to, "/net/deploy/#{fetch(:stage)}/#{fetch(:application)}"
