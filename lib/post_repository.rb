require 'post'

class PostRepository
    def find_with_tag(id)
        # Executes the SQL query:
        # SELECT posts.id, posts.title FROM posts JOIN posts_tags ON posts_tags.post_id = posts.id JOIN tags ON posts_tags.tag_id = tags.id WHERE tags.id = $1;
        sql = 'SELECT posts.id, posts.title FROM posts JOIN posts_tags ON posts_tags.post_id = posts.id JOIN tags ON posts_tags.tag_id = tags.id WHERE tags.id = $1;'
        params = [id]
        results = DatabaseConnection.exec_params(sql, params)
        posts = []
     #   post = Post.new
       # post.id = results.first['id']
       # post.title = results.first['title']
      
       # return post

        results.each do |record|
            puts record['title']
            post = Post.new
            post.id = record['id']
            post.title = record['title']      
            posts << post
          end
      
          return posts
        # Returns a post with an array of comments object.
      end
end