# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class


class User
  attr_accessor:name
  def initialize(name)
    @name=name
  end

  def comments
    Comment.all.select do |comment|
      comment.user == self
    end
  end

  def commented_photos
    self.comments.map do |comment|
      comment.photo
    end
  end

end

class Comment
  attr_accessor:user,:photo,:message

  @@all=[]
              #string, instance, instance
  def initialize(message,user,photo)
    @message=message
    @user=user
    @photo=photo
    @@all << self
  end

  def self.all
    @@all
  end

end

class Photo

  def make_comments (message,user)
    Comment.new(message, user, self)
  end

  def comments
    Comment.all.select do |comment|
      comment.photo == self
    end
  end

  def users_who_have_commented
    self.comments.map do |comment|
      comment.user
    end
  end

end


#
# sandwich_photo = Photo.new
# sophie = User.new("Sophie")
# # => "Sophie"
# user.photos
# # => [#<Photo:0x00007fae2880b370>]
#
#
# sandwich_photo.comments
# # => []
#
# sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
# sandwich_photo.comments
# # => [#<Comment:0x00007fae28043700>]
#
# Comment.all
# #=> [#<Comment:0x00007fae28043700>]
