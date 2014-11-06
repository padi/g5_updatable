class G5Updatable::IntegrationSettingsUpdater
  def initialize(g5_integration_settings)
    @g5_integration_settings = g5_integration_settings
  end

  def update
    @g5_integration_settings.each do |g5_integration_setting|
      attributes = g5_integration_setting.integration_setting_hash.dup

      G5Updatable::IntegrationSetting.
          find_or_initialize_by(uid: attributes[:uid]).
          update_attributes!(
          urn:                      attributes[:urn],
          location_uid:             attributes[:location_uid],
          vendor_action:            attributes[:vendor_action],
          job_frequency_in_minutes: attributes[:job_frequency_in_minutes],
          properties:               attributes
      )
    end
  end
end
