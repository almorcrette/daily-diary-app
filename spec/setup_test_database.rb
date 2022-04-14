require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'daily_diary_test')
  # connection.exec("TRUNCATE ;") #need to add table to truncate
end