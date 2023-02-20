class AuthenticateAuthor
    prepend SimpleCommand
  
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def call
      JsonWebToken.encode(author_id: author.id) if author
    end
  
    private
  
    attr_accessor :email, :password
  
    def author
      author = Author.find_by_email(email)
      return author if author && author.authenticate(password)
  
      errors.add :author_authentication, 'invalid credentials'
      nil
    end
  end  