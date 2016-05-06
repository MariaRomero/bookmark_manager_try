feature 'Viewing links' do

  before (:each) do
    Link.create(url:'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url:'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'Search Enngine')])
    Link.create(url:'http://www.bubblesintheworld.com', title: 'World', tags: [Tag.first_or_create(name: 'Bubbles')])
    Link.create(url:'http://www.bubbleseverywhere.com', title: 'Bubbles Everywhere', tags: [Tag.first_or_create(name: 'Bubbles')])
  end

  scenario 'I can see existing links on the links page' do
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario 'I can search for links through tags' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Google')
      expect(page).to have_content('World')
      expect(page).to have_content('Bubbles Everywhere')
    end
  end

end
