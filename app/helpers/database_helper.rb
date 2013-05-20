module DatabaseHelper
  database_cfg = YAML.load(ERB.new(IO.read(File.join(Integration::App.dir,
      'config', "database.yml"))).result)

  mattr_accessor :pingifes_details, :sigaa_details, :comum_details, :admin_details
  @@pingifes_details = database_cfg['pingifes']
  @@sigaa_details = database_cfg['sigaa']
  @@comum_details = database_cfg['comum']
  @@admin_details = database_cfg['admin']

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

  module COMUM
    def self.included(base)
      base.establish_connection DatabaseHelper.comum_details
    end
  end

  module ADMIN
    def self.included(base)
      base.establish_connection DatabaseHelper.admin_details
    end
  end
end
