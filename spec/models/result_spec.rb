require 'rails_helper'

RSpec.describe Result, type: :model do
  let(:result) { create(:result) }
  let(:player) { create(:player) }
  let(:match) { create(:match, home_team: player.team) }

  describe '#achieved_by' do
    it 'increases player results collection by one' do
      expect { result.achieved_by(player, match) }
        .to change { player.results.count }.from(0).to(1)
    end

    it 'does not create the same performance twice' do
      result.achieved_by(player, match)
      expect { result.achieved_by(player, match) }.not_to change { Performance.count }
    end
  end

  describe '#top_five_players' do
    let(:team) { create(:team) }
    let(:teammates) { create_list(:player, 5, team:) }
    let(:players) { create_list(:player, 5) }

    before do
      3.times do |i|
        result.achieved_by(teammates[i], match)
        result.achieved_by(players[-i], match)
      end
    end

    context 'with one result' do
      it 'returns all top players on the team' do
        expect(result.top_five_players(team).count).to eq(3)
      end

      it 'returns all top players among all teams' do
        expect(result.top_five_players.count).to eq(5)
      end

      it 'returns team`s best players in right order' do
        expect(result.top_five_players(team).first).to eq(teammates[0].full_name)
      end

      it 'returns all best players in right order' do
        expect(result.top_five_players.last).to eq(players[3].full_name)
      end
    end


    context 'with two results' do
      let(:new_match) { create(:match) }

      before do
        result.achieved_by(teammates[4], match)
        result.achieved_by(teammates[4], new_match)
      end

      it 'returns all top players on the team' do
        expect(result.top_five_players(team).count).to eq(4)
      end

      it 'returns all best players in right order' do
        expect(result.top_five_players.first).to eq(teammates[4].full_name)
      end
    end
  end
end
