class CommentPolicy
    attr_reader :comment, :record
  
    def initialize(comment, record)
      @comment = comment
      @record = record
    end

    def delete?
      comment.user_id == record.id
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
  
      attr_reader :comment, :scope
    end
end