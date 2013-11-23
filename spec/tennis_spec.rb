require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to be(game.player2)
      expect(game.player2.opponent).to be(game.player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)

      expect(game.player1.points).to eq(game.player1)
    end
  end

  describe '#duece' do
    it 'when players are tied with at least 3 points' do
      game.duece

      game.player1.points = 3
      game.player2.points = 3

      expect(game.duece).to eq("duece")
    end
  end

  describe '#advantage' do
    it 'when players are at 3 points at least, and one goes up by 1' do
      game.advantage

      game.player1.points = 4
      game.player2.points = 3

      expect(game.advantage).to eq("advantage, player 1")
    end
  end

    describe '#win_game' do
    it 'declares the winner of the game' do
      game.win_game

      game.player1.points = 4
      game.player2.points = 2

      expect(game.win_game).to eq("player1 wins")
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2 
        expect(player.score).to eq('thirty')
      end
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3
        expect(player.score).to eq('forty')
      end
    end
  end
end