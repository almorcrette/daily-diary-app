feature 'List of all Diary Entry titles' do
  scenario 'User wants to view summary of all their entries' do
    visit '/'
    fill_in('title', with: 'My first entry')
    fill_in('content', with: "My first diary entry's content")
    click_button('Save new entry')
    visit '/diaryentries'
    expect(page).to have_link('My first entry', href: './1')
  end
end