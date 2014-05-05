class SubsController < ApplicationController

  def index
    @subs = Sub.all
    render :index
  end

  def new
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :mod_id)
  end

end
