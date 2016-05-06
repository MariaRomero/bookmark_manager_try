feature 'Saving a new link' do

  scenario 'I am able to save a new link' do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'www.google.co.uk'
    fill_in :tags, with: 'Search Engine'
    click_button 'Save Link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
