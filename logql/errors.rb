module LogQL
  module Errors
    def self.for_app(app)
      %({app="#{app}", level="error"})
    end
  end
end
