class SpudUser < ActiveRecord::Base
	include Concerns::SpudAuthentication

	has_many :spud_admin_permissions,:foreign_key => :user_id
	has_many :spud_user_settings
	accepts_nested_attributes_for :spud_admin_permissions, :allow_destroy => true

	attr_accessible :login,:email,:first_name,:last_name,:password,:password_confirmation,:password_salt,:last_login_at,:last_request_at,:last_login_ip,:failed_login_count,:current_login_at,:login_count,:persistence_token,:perishable_token,:single_access_token,:crypted_password, :current_login_ip, :created_at, :updated_at,:spud_admin_permissions_attributes,:time_zone, :as => [:default, :admin]
	attr_accessible :super_admin, :id, :as => :admin

	def has_admin_rights?
		return self.super_admin || self.spud_admin_permissions.count > 0
	end

	def full_name
		if first_name.blank? && last_name.blank?
			return self.login
		end
		if self.first_name.blank?
			return self.last_name
		elsif self.last_name.blank?
			return self.first_name
		end
		return "#{self.first_name} #{self.last_name}"
	end
end
