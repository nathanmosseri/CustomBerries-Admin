Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:4000'

    resource '/products',
      headers: :any,
      methods: [:get]
    resource '/cart_items',
      headers: :any,
      methods: [:post]
    resource '/cart_items/:id',
      headers: :any,
      methods: [:delete]
    resource '/carts/:sess_id',
      headers: :any,
      methods: [:show]
  end

  allow do
    origins 'http://localhost:3001'

    resource '*',
      :headers => :any,
      :methods => [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
