require 'rspec'
require 'simplecov'
require './lib/game_statistics'

require 'pry'

SimpleCov.start

describe GameStatistics do
    describe '#self.highest_total_score' do
        it 'can return the highest scored game' do
            expect(GameStatistics.highest_total_score).to eq 11
        end
    end
end