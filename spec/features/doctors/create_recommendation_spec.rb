RSpec.describe 'CreateRecommendation' do
  describe 'create recommendation flow' do
    let!(:doctor) { create(:doctor) }
    let!(:appointment) { create(:appointment, doctor:) }

    before { sign_in doctor }

    context 'when fill in the form' do
      let(:recommendation_content) { 'You are ok!' }

      before do
        visit new_appointment_recommendation_path(appointment)
        fill_in('recommendation[content]', with: recommendation_content)
        click_button('Create Recommendation')
      end

      it 'redirects to appointments page' do
        expect(page).to have_current_path(appointments_path)
      end

      it 'shows recommendation' do
        expect(page).to have_content(recommendation_content)
      end
    end

    context 'when submit an empty form' do
      before do
        visit new_appointment_recommendation_path(appointment)
        click_button('Create Recommendation')
      end

      it 'shows error message' do
        expect(page).to have_content('Content can\'t be blank')
      end
    end
  end
end
