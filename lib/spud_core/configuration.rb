module Spud
  module Core
    include ActiveSupport::Configurable
    config_accessor :site_name,:admin_applications,:sitemap_urls,:multisite_mode_enabled,:multisite_config
    self.admin_applications = [{:name => "Users",:thumbnail => "spud/admin/users_thumb.png",:url => "/spud/admin/users",:order => 100}]
    self.site_name = "Company Name"
    self.sitemap_urls = []
    self.multisite_mode_enabled = false
    self.multisite_config = []
  end
end
