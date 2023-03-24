require 'tag'

class TagRepository
    def find_with_post(id)
        # Executes the SQL query:
        # SELECT tags.id, tags.name FROM tags JOIN posts_tags ON posts_tags.tag_id = tags.id JOIN posts ON posts_tags.post_id = posts.id WHERE posts.id = $1;
        sql = 'SELECT tags.id, tags.name FROM tags JOIN posts_tags ON posts_tags.tag_id = tags.id JOIN posts ON posts_tags.post_id = posts.id WHERE posts.id = $1;'
        params = [id]
        results = DatabaseConnection.exec_params(sql, params)

        tags = []

        results.each do |record|
            tag = Tag.new
            tag.id = record['id']
            tag.name = record['name']      
            tags << tag
          end
      
          return tags
        # Returns a post with an array of comments object.
    end
end