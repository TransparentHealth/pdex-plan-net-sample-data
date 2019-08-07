require_relative 'telecom'
require_relative 'utils/formatting'
require_relative 'utils/nucc_codes'

module PDEX
  class HealthcareServiceFactory
    include Formatting
    # include Address
    include Telecom

    attr_reader :source_data, :service_type, :profile

    def initialize(nppes_organization, service_type)
      @source_data = nppes_organization
      @service_type = service_type
      @profile = HEALTHCARE_SERVICE_PROFILE_URL
    end

    def build
      FHIR::HealthcareService.new(
        {
          id: id,
          meta: meta,
          identifier: identifier,
          active: true,
          providedBy: provided_by,
          type: type,
          specialty: specialty,
          location: location,
          name: name,
          comment: comment,
          serviceProvisionCode: service_provision_code,
          referralMethod: referral_method,
          appointmentRequired: true,
          telecom: telecom,
          availableTime: available_time
        }
      )
    end

    private

    def id
      "#{service_type}-healthcareservice-#{source_data.npi}"
    end

    def meta
      {
        profile: [profile]
      }
    end

    def identifier_system
      "http://#{format_for_url(source_data.name)}"
    end

    def identifier
      {
        use: 'secondary',
        type: {
          coding: [
            {
              system: 'http://terminology.hl7.org/CodeSystem/v2-0203',
              code: 'PRN',
              display: 'Provider number',
            }
          ],
          text: 'Healthcare Service Number'
        },
        system: identifier_system,
        value: "#{source_data.npi}-#{service_type}",
        assigner: {
          reference: "Organization/vhdir-organization-#{source_data.npi}",
          display: source_data.name
        }
      }
    end

    def provided_by
      {
        reference: "Organization/vhdir-organization-#{source_data.npi}",
        display: source_data.name
      }
    end

    def service_type_display
      service_type.capitalize
    end

    def type
      [
        {
          coding: [
            {
              system: "#{identifier_system}/service-types",
              code: service_type,
              display: service_type_display
            }
          ],
          text: service_type_display
        }
      ]
    end

    def location
      [
        {
          reference: "Location/vhdir-location-#{source_data.npi}",
          display: source_data.name
        }
      ]
    end

    def name
      source_data.name
    end

    def service_provision_code
      [
        {
          coding: [
            {
              code: 'cost',
              system: 'http://terminology.hl7.org/CodeSystem/service-provision-conditions',
              display: 'Fees apply'
            }
          ]
        }
      ]
    end

    def referral_method
      [
        {
          coding: [
            {
              code: 'phone',
              system: 'http://terminology.hl7.org/CodeSystem/service-referral-method',
              display: 'phone'
            }
          ]
        },
        {
          coding: [
            {
              code: 'fax',
              system: 'http://terminology.hl7.org/CodeSystem/service-referral-method',
              display: 'fax'
            }
          ]
        }
      ]
    end

    def available_time
      [
        {
          daysOfWeek: ['mon', 'tue', 'wed', 'thu', 'fri'],
          allDay: false,
          availableStartTime: '08:00:00',
          availableEndTime: '18:00:00'
        }
      ]
    end

    def comment
      "Specialties include: #{NUCCCodes.specialties_display(service_type)}"
    end

    def specialty
      NUCCCodes.specialty_codes(service_type).map do |code|
        display = NUCCCodes.specialty_display(code)
        {
          coding: [
            {
              code: code,
              system: 'http://nucc.org/provider-taxonomy',
              display: display
            }
          ],
          text: display
        }
      end
    end
  end
end