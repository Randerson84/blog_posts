require 'tag_repository'

def reset_tags_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_tags' })
    connection.exec(seed_sql)
end
RSpec.describe PostRepository do
    before(:each) do 
        reset_tags_table
    end
    it 'finds all tags related to a post' do
        repo = TagRepository.new
        tag = repo.find_with_post(1)

        expect(tag[0].name).to eq 'coding'
        expect(tag.length).to eq 1
    end
end