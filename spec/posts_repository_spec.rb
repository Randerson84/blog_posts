require 'post_repository'

def reset_posts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_posts_tags' })
    connection.exec(seed_sql)
end
RSpec.describe PostRepository do
    before(:each) do 
        reset_posts_table
    end
    it 'finds all posts related to a tag' do
        repo = PostRepository.new
        post = repo.find_with_tag(1)

        expect(post[0].title).to eq 'SQL basics'
        expect(post.length).to eq 1
    end
end