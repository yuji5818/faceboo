class TopicsControllerTest < ActionController::TestCase
  before_action :authenticate_user!


  def index
    @topic = Topic.all
  end

end
