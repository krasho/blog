class CategoryService
   attr_reader :service

   def new
      @service = Category.new
   end

   def all
      @service = Category.all
   end

   def find (id)
      @service = Category.find id
   end

end
