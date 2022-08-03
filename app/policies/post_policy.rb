# frozen_string_literal: true

class PostPolicy
    attr_reader :post, :record
  
    def initialize(post, record)
      @post = post
      @record = record
    end
  
    def edit?
      post.user_id == record.id
    end

    def update?
      post.user_id == record.id
    end
  
    def delete?
      post.user_id == record.id
    end
  
    class Scope
      def initialize(post, scope)
        @post = post
        @scope = scope
      end
  
      def resolve
        raise NotImplementedError, "You must define #resolve in #{self.class}"
      end
  
      private
  
      attr_reader :post, :scope
    end
end