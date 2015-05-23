class PostService
   attr_reader :service

   def new
      @service = Post.new
   end

   def all
      @service = Post.all
   end

   def find (id)
      @service = Post.find id
   end

end
