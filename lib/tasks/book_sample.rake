namespace :book_sample do
  desc "create book sample"
  task :create => :environment do
    book = Book.create!({
                   title: 'Book 1',
                   authors: [ Person.first ],
                   editions_attributes: [
                     {
                       name: '1',
                       cover_attributes: {
                         pic: 'c1'
                       }
                     }
                   ],
                   isbn_attributes: {number: '111'}
                 })
  end
end
