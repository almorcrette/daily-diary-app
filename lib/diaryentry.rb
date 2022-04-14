require 'pg'

class DiaryEntry

  attr_reader :id, :title, :content

  def initialize(id:, title:, content:)
    @id = id
    @title = title
    @content = content
  end

  def self.all
    connection = self.connect_test_nontest
    result = connection.exec("SELECT * FROM diaryentries;")
    result.map do |entry|
      DiaryEntry.new(id: entry['id'], title: entry['title'], content: entry['content'])
    end
  end

  def self.create(title:, content:)
    connection = self.connect_test_nontest
    connection.exec("INSERT INTO diaryentries(title,content) VALUES('#{title}','#{content}') RETURNING id, title, content;")

  end

  private

  def self.connect_test_nontest
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')  
    else
      connection = PG.connect(dbname: 'daily_diary')
   end
  end

end