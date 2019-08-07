require_relative '../../lib/pdex'
require_relative '../../lib/pdex/nppes_plan'
require 'csv'

RSpec.describe PDEX::NPPESPlan do
  let(:raw_plans) do
    fixture_path = File.join(__dir__, '..', 'fixtures', 'plan.csv')
    [].tap do |plans|
      CSV.foreach(fixture_path, headers: true) do |row|
        plans << row
      end
    end
  end

  let(:raw_plan) { raw_plans.first }
  let(:plan) { described_class.new(raw_plan) }

  describe '.initialize' do
    it 'creates a NPPESPlan instance' do
      expect(plan).to be_a(described_class)
    end
  end

  describe '#id' do
    it 'returns the plan id' do
      expect(plan.id).to eq('HPID240000')
    end
  end

  describe '#type' do
    it 'returns the type' do
      expect(plan.type).to be_present
    end
  end

  describe '#type_display' do
    it 'returns the type display' do
      expect(plan.type_display).to be_present
    end
  end

  describe '#name' do
    it 'returns the name' do
      expect(plan.name).to eq('Acme Insurance Co of MassachusettsBronze PPO Plan')
    end
  end

  describe '#alias' do
    it 'returns the alias' do
      expect(plan.alias).to eq('Acme MA BRONZE PPO')
    end
  end

  describe '#owner_id' do
    it 'returns the owner_id' do
      expect(plan.owner_id).to eq('9990120000')
    end
  end

  describe '#owner_name' do
    it 'returns the owner_name' do
      expect(plan.owner_name).to eq('Acme Insurance Co of Massachusetts')
    end
  end

  describe '#administrator_id' do
    it 'returns the administrator_id' do
      expect(plan.administrator_id).to eq('9990120000')
    end
  end

  describe '#administrator_name' do
    it 'returns the administrator_name' do
      expect(plan.administrator_name).to eq('Acme Insurance Co of Massachusetts')
    end
  end

  describe '#coverage' do
    it 'returns the coverage area' do
      expect(plan.coverage).to eq('Greater Boston Area')
    end
  end

  describe '#network_id' do
    it 'returns the network id' do
      expect(plan.network_id).to eq('HPID010000')
    end
  end

  describe '#network_name' do
    it 'returns the network name' do
      expect(plan.network_name).to eq('Acme of Massechusetts Preferred Provider Network')
    end
  end
  # describe '#phone_numbers' do
  #   it 'returns an array of phone numbers' do
  #     expect(plan.phone_numbers).to eq(['6075555555'])
  #   end
  # end

  # describe '#fax_numbers' do
  #   it 'returns an empty array' do
  #     expect(plan.fax_numbers).to eq([])
  #   end
  # end

  # describe '#address' do
  #   it 'returns the address' do
  #     expected_address = OpenStruct.new(
  #       {
  #         lines: ['120 St James Ave'],
  #         city: 'Boston',
  #         state: 'MA',
  #         zip: '02101'
  #       }
  #     )

  #     expect(plan.address).to eq(expected_address)
  #   end
  # end

  # describe '#contact_first_name' do
  #   it 'returns a name' do
  #     expect(plan.contact_first_name).to be_present
  #   end
  # end

  # describe '#contact_last_name' do
  #   it 'returns a name' do
  #     expect(plan.contact_last_name).to be_present
  #   end
  # end
end