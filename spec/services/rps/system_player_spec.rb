describe RPS::SystemPlayer do

  subject { described_class.new.play }

  it 'requests Curb to play' do
    expect_any_instance_of(RPS::Curb).to receive(:play).once
    subject
  end

  it 'plays locally when Curb is not responding' do
    allow_any_instance_of(RPS::Curb).to receive(:play).and_raise(RPS::Errors::GameApiError)

    expect{ subject }.not_to raise_error
    expect(RPS::Game::PLAY_OPTIONS).to include(subject)
  end
end
