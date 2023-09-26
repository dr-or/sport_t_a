require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#achieve?' do
    let(:player1) { create(:player) }
    let(:player2) { create(:player, team: player1.team) }
    let(:matches) { create_list(:match, 6, home_team: player1.team) }
    let(:result) { create(:result) }

    before do
      result.achieved_by(player1, matches[1])
      result.achieved_by(player2, matches[0])
    end

    it 'returns true' do
      expect(player1.achieve_recently?(result)).to be true
    end

    it 'returns false' do
      expect(player2.achieve_recently?(result)).to be false
    end
  end
end
