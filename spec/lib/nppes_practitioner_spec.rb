require_relative '../../lib/pdex'
require_relative '../../lib/pdex/nppes_practitioner'
require 'csv'

RSpec.describe PDEX::NPPESPractitioner do
  let(:raw_practitioners) do
    fixture_path = File.join(__dir__, '..', 'fixtures', 'practitioner.csv')
    [].tap do |practitioners|
      CSV.foreach(fixture_path, headers: true) do |row|
        practitioners << row
      end
    end
  end

  let(:raw_practitioner) { raw_practitioners.first }
  let(:practitioner) { described_class.new(raw_practitioner) }

  describe '.initialize' do
    it 'creates a NPPESPractitioner instance' do
      expect(practitioner).to be_a(described_class)
    end
  end

  describe '#npi' do
    it 'returns the npi' do
      expect(practitioner.npi).to eq('1255334207')
    end
  end

  describe '#name' do
    it 'returns the name' do
      name = practitioner.name
      name_fields = [:first, :middle, :last, :suffix, :prefix, :credential]
      name_fields.each { |field| expect(name).to respond_to field }
      expect(name.first).to eq('Richard')
      expect(name.middle).to eq('')
      expect(name.last).to eq('Soucier')
      expect(name.suffix).to eq('')
      expect(name.prefix).to eq('')
      expect(name.credential).to eq('MD')
    end
  end

  describe '#phone_numbers' do
    it 'returns an array of phone numbers' do
      expect(practitioner.phone_numbers).to eq(['8607146581', '8607144820'])
    end
  end

  describe '#fax_numbers' do
    it 'returns an array of fax numbers' do
      expect(practitioner.fax_numbers).to eq(['8607148311', '8607148001'])
    end
  end

  describe '#address' do
    it 'returns an address' do
      expected_address = OpenStruct.new(
        {
          lines: ['1000 ASYLUM AVE', 'STE 4309'],
          city: 'HARTFORD',
          state: 'CT',
          zip: '061051770'
        }
      )
      expect(practitioner.address).to eq(expected_address)
    end
  end

  describe '#gender' do
    it 'returns a gender' do
      expect(practitioner.gender).to eq('M')
    end
  end

  describe '#qualifications' do
    it 'returns an array of qualifications' do
      expected_qualifications = [
        OpenStruct.new(
          {
            state: 'CT',
            license_number: '033435',
            taxonomy_code: '207RC0000X'
          }
        ),
        OpenStruct.new(
          {
            state: 'CT',
            license_number: '033435',
            taxonomy_code: '207RA0001X'
          }
        )
      ]

      expect(practitioner.qualifications).to eq(expected_qualifications)
    end
  end
end
