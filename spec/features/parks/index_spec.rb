require 'rails_helper'

RSpec.describe '/parks', type: :feature do
  describe 'When I select "Tennessee" from the form & click on "Find Parks"' do
    before :each do
      visit root_path
  
      select 'Tennessee', from: :state
      click_button 'Find Parks'
    end

    it 'shows the total number of parks found' do
      expect(page).to have_content('Found 15 parks in TN')
      expect(page).to have_css('div.park-info', count: 15)
    end
    
    context 'For each park found' do
      it 'shows the full name of the park' do
        expect(page).to have_css('h2.park-name', count: 15)
        expect(page).to have_content('Andrew Johnson National Historic Site')
      end

      it 'shows the description of the park' do
        expect(page).to have_css('p.park-description', count: 15)
        expect(page).to have_content("Andrew Johnson's complex presidency (1865-69) illustrates the Constitution at work following the Civil War. ")
      end

      it 'shows direction information' do
        expect(page).to have_css('p.park-directions', count: 15)
        expect(page).to have_content('To arrive at the Visitor Center, use 101 North College Street, Greeneville, TN.')
      end

      it 'show hours of operation' do
        expect(page).to have_css('ul.park-operating-hours', count: 15)

        first('ul.park-operating-hours') do
          expect(page).to have_css('li.monday')
          expect(page).to have_css('li.tuesday')
          expect(page).to have_css('li.wednesday')
          expect(page).to have_css('li.monday')
          expect(page).to have_css('li.monday')
        end
      end
    end
  end
end