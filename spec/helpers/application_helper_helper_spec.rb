require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#page_title' do
    it "returns 'Git Contributions' as title" do
      expect(helper.page_title).to eq('Git Contributions')
    end

    context 'when a content_for :title is set' do
      let(:title) { 'rails' }
      it 'adds it to the output' do
        helper.content_for :title, title
        expect(helper.page_title).to eq('Git Contributions - rails')
      end
    end
  end
end
