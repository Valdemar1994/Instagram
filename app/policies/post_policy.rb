# frozen_string_literal: true

class PostPolicy
    attr_reader :user, :post, :record
  
    def initialize(user, post, record)
      @user = user
      @post = post
      @record = record
    end
  
    def edit?
      record == user
    end

    def update?
      edit?
    end
  
    def delete?
      delete?
    end
  
    class Scope
      def initialize(user, post, scope)
        @user = user
        @post = post
        @scope = scope
      end
  
      def resolve
        raise NotImplementedError, "You must define #resolve in #{self.class}"
      end
  
      private
  
      attr_reader :user, :post, :scope
    end
end