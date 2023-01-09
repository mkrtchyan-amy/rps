RSpec.describe GameController do
  describe 'GET index' do
    subject! { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe 'POST play' do
    subject { post :play, params: { move: 'rock'} }

    it 'invokes the game' do
      expect_any_instance_of(RPS::Game).to receive(:play).once
      subject
    end
  end
end
