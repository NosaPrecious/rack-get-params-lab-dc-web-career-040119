require 'pry'
class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
      
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
      
    elsif req.path.match(/cart/)
     resp.write handle_empty_cart
      
    elsif req.path.match(/add/)
      binding.pry
     
    else
      resp.write "Path Not Found"
    end
    
    resp.finish
  end
  
  def handle_add(add_item)
    if @@items.include?(product)
      
    end
    binding.pry
  end
  
  def handle_empty_cart
     len = @@cart.length
      if len == 0
      return "Your cart is empty"
      else
        @@cart.each do |item|
          return "#{item}\n"
          end
      end
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
