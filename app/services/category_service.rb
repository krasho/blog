class CategoryService
   attr_reader :service

   def new (params = "")
      if (params == "")
          @service = Category.new
      else
          @service = Category.new params
      end

   end

   def all
      @service = Category.all
   end

   def find (id)
      @service = Category.find id
   end

end
