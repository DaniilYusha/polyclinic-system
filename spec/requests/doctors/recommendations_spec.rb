RSpec.describe 'Doctors::Recommendations' do
  describe 'POST /recommendations' do
    let(:doctor) { create(:doctor) }
    let(:appointment) { create(:appointment, doctor:) }

    context 'with valid params' do
      subject(:request) { post appointment_recommendations_path(appointment), params: }

      let(:params) { { recommendation: { content: 'You are ok!', appointment_id: appointment.id } } }

      before { sign_in doctor }

      it 'creates recommendation' do
        expect { request }.to change(Recommendation, :count).by(1)
      end

      it 'changes appointment status to closed' do
        expect { request }.to change { appointment.reload.status }.from('pending').to('closed')
      end

      it 'returns http status 302' do
        request

        expect(response).to have_http_status(:found)
      end

      it 'redirects to appointments page' do
        expect(request).to redirect_to(appointments_path)
      end
    end

    context 'with invalid params' do
      subject(:request) { post appointment_recommendations_path(appointment), params: }

      let(:params) { { recommendation: { content: '', appointment_id: appointment.id } } }

      before { sign_in doctor }

      it 'does not create recommendation' do
        expect { request }.not_to change(Recommendation, :count)
      end

      it 'does not change appointment status to closed' do
        expect { request }.not_to(change { appointment.reload.status })
      end

      it 'returns http status 200' do
        request

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
