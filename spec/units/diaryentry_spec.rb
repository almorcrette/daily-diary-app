require_relative '../../lib/diaryentry.rb'

describe DiaryEntry do
  describe '.create' do
    it 'creates a new entry with a title and content' do
      connection = PG.connect(dbname: 'daily_diary_test')
      DiaryEntry.create(title: 'My first entry', content: "My first diary entrys content")
      entries = DiaryEntry.all
      expect(entries.first.title).to eq 'My first entry'
      expect(entries.first.content).to eq "My first diary entrys content"
    end
  end
end