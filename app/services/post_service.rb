class PostService
   attr_reader :service

   def new
      @service = Post.new
   end

   def all
      @service = Post.order("publish_date DESC").all
   end

   def find (id)
      @service = Post.find id
   end

end
