
require 'rails_helper'

RSpec.describe Task do
    it { expect(described_class.new).to validate_presence_of :description }
    it { expect(described_class.new).to validate_presence_of :completed_at }
end