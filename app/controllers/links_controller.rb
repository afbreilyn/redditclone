class LinksController < ApplicationController
  before_action :require_logged_in!

  def new
    @link = Link.new
    @subs = Sub.all
  end

  def create

    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to link_url(@link)
    else
      @subs = Sub.all
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end

  end

  def show
    @link = Link.find_by(id: params[:id])
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :text, :poster_id, {:sub_ids => []})
    # fail
  end

end
