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

    describe '#self.lowest_total_score' do
        it 'can return the lowest scored game' do
           expect(GameStatistics.lowest_total_score).to eq 0 
        end
    end

    describe '#self.percentage_home_wins' do
        it 'can return the percentage of games won by the home team' do
            expect(GameStatistics.percentage_home_wins).to eq 0.44
        end
    end

    describe '#percentage_visitor_wins' do
        it 'can return the percentage of games won by the visiting team' do
            expect(GameStatistics.percentage_visitor_wins).to eq 0.36
        end
    end
end