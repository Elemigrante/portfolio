class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  before_action :set_sidebar_topics
  layout 'blog'
  
  def index
    @topics = Topic.all
  end

  def show
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end
  
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully deleted.' }
    end
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
