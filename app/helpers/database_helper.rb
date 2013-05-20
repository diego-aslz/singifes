module DatabaseHelper
  database_cfg = YAML.load(ERB.new(IO.read(File.join(Integration::App.dir,
      'config', "database.yml"))).result)

  mattr_accessor :pingifes_details, :sigaa_details
  @@pingifes_details = database_cfg['pingifes']
  @@sigaa_details = database_cfg['sigaa']
  @@sipac_details = database_cfg['sipac']
  @@sigrh_details = database_cfg['sigrh']

  module Pingifes
    def self.included(base)
      base.establish_connection DatabaseHelper.pingifes_details
    end
  end

  module SIGAA
    def self.included(base)
      base.establish_connection DatabaseHelper.sigaa_details
    end
  end

  module SIPAC
    def self.included(base)
      base.establish_connection DatabaseHelper.sipac_details
    end
  end

  module SIGRH
    def self.included(base)
      base.establish_connection DatabaseHelper.sigrh_details
    end
  end
end
