describe RPS::Game do
  describe 'play' do
    def play(move)
      described_class.new(move).play
    end

    context 'with valid move' do
      let(:system_move) { 'rock' }
      before { expect_any_instance_of(RPS::SystemPlayer).to receive(:play).and_return(system_move) }

      it 'player wins the game' do
        expect(play('paper')).to eq ['WON', system_move]
      end

      it 'player loses the game' do
        expect(play('scissors')).to eq ['LOST', system_move]
      end

      it  'the game is tied' do
        expect(play('rock')).to eq ['TIED', system_move]
      end
    end

    context 'with invalid move' do
      it 'raises an error' do
        expect { play('lizard') }.to raise_error RPS::Errors::InvalidMoveError
      end
    end
  end
end
