module Controllers
  class Conversations < Virtuatable::Controllers::Base
    api_route 'get', '/',{authenticated: false} do
      api_ok 'Hello world !'
    end
  end
end