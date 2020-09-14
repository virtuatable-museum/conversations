# frozen_string_literal: true

# Main module for all the controllers of the web application
# @author Vincent Courtois <courtois.vincent@outlook.com>
module Controllers
  # Insert more informations about your controller here.
  # @author Vincent Courtois <courtois.vincent@outlook.com>
  class Conversations < Virtuatable::Controllers::Base
    api_route 'get', '/', { authenticated: false } do
      api_ok 'Hello world !'
    end
  end
end
