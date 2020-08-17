require 'active_support'
require 'active_support/core_ext/object'

require_relative 'pdex/nppes_data_loader'
require_relative 'pdex/nppes_data_repo'
require_relative 'pdex/fhir_generator'
require_relative 'pdex/organization_generator'
require_relative 'pdex/practitioner_generator'
require_relative 'pdex/nppes_network'
require_relative 'pdex/nppes_organization'
require_relative 'pdex/nppes_managing_org'
require_relative 'pdex/nppes_practitioner'
require_relative 'pdex/pharmacy_data'
require_relative 'pdex/pharmacy_org_data'
require_relative 'pdex/endpoint_factory'
require_relative 'pdex/healthcare_service_factory'
require_relative 'pdex/insurance_plan_factory'
require_relative 'pdex/location_factory'
require_relative 'pdex/network_factory'
require_relative 'pdex/organization_affiliation_factory'
require_relative 'pdex/organization_factory'
require_relative 'pdex/practitioner_factory'
require_relative 'pdex/practitioner_role_factory'
require_relative 'pdex/utils/nucc_codes'

module PDEX
  ENDPOINT_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-Endpoint'
  HEALTHCARE_SERVICE_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-HealthcareService'
  INSURANCE_PLAN_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-InsurancePlan'
  NETWORK_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-Network'
  PRACTITIONER_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-Practitioner'
  PRACTITIONER_ROLE_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-PractitionerRole'
  ORGANIZATION_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-Organization'
  ORGANIZATION_AFFILIATION_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-OrganizationAffiliation'
  LOCATION_PROFILE_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-Location'

  ACCESSIBILITY_EXTENSION_URL = 'http://hl7.org/fhir/uv/vhdir/StructureDefinition/accessibility'
  COMMUNICATION_PROFICIENCY_EXTENSION_URL = 'http://hl7.org/fhir/uv/vhdir/StructureDefinition/communication-proficiency'
  CONTACT_POINT_AVAILABLE_TIME_EXTENSION_URL = 'http://hl7.org/fhir/uv/vhdir/StructureDefinition/contactpoint-availabletime'
  ENDPOINT_USE_CASE_EXTENSION_URL = 'http://hl7.org/fhir/uv/vhdir/StructureDefinition/endpoint-usecase'
  FROM_NETWORK_EXTENSION_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-FromNetwork-extension'
  PARTICIPATING_NETWORK_EXTENSION_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-ParticipatingNetwork-extension'
  NEW_PATIENTS_EXTENSION_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-NewPatients-extension'
  NEW_PATIENT_PROFILE_EXTENSION_URL = 'http://hl7.org/fhir/uv/vhdir/StructureDefinition/newpatientprofile'
  ACCEPTING_NEW_PATIENTS_EXTENSION_URL='http://hl7.org/fhir/us/davinci-pdex-plan-net/StructureDefinition/plannet-AcceptingPatients-extension'
  PRACTITIONER_QUALIFICATION_EXTENSION_URL = 'http://hl7.org/fhir/uv/vhdir/StructureDefinition/practitioner-qualification'

  ACCESSIBILITY_CODE_SYSTEM_URL = 'http://hl7.org/fhir/uv/vhdir/CodeSystem/accessibility'
  COMMUNICATION_PROFICIENCY_SYSTEM_URL = 'http://hl7.org/fhir/uv/vhdir/CodeSystem/languageproficiency'
  ENDPOINT_USE_CASE_SYSTEM_URL = 'http://hl7.org/fhir/uv/vhdir/CodeSystem/usecase'
  PAYER_CHARACTERISTICS_CODE_SYSTEM_URL = 'http://hl7.org/fhir/uv/vhdir/CodeSystem/payercharacteristics'
  INSURANCE_PLAN_TYPE_CODE_SYSTEM_URL = 'http://hl7.org/fhir/ValueSet/insuranceplan-type'
  ACCEPTING_PATIENTS_CODE_SYSTEM_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/CodeSystem/AcceptingPatientsCS'
  HEALTHCARE_SERVICE_CATEGORY_CODE_SYSTEM_URL = 'http://hl7.org/fhir/us/davinci-pdex-plan-net/CodeSystem/HealthcareServiceCategoryCS'

  HEALTHCARE_SERVICE_CATEGORY_TYPES = {
    pharmacy: "Pharmacy",
    group: "Group",
    outpatient: "Outpatient",
    provider: "Provider"
  }
  
end
