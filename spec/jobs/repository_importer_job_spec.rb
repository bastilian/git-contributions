require 'rails_helper'

RSpec.describe RepositoryImportJob, type: :job do
  let(:repository) { FactoryGirl.create(:repository) }

  describe '#perform' do
    it 'clones and imports the given repository' do
      expect(repository).to receive(:clone)
      expect(repository).to receive(:import)

      subject.perform(repository)
    end
  end
end
