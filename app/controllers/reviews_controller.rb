class ReviewsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show]

  # GET subjects/1/reviews/1
  # GET subjects/1/reviews/1.json
  def show
    @subject = Subject.find(params[:subject_id])
    @review = @subject.reviews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @review }
    end
  end

  # GET subjects/1/reviews/new
  # GET subjects/1/reviews/new.json
  def new
    @subject = Subject.find(params[:subject_id])
    @review = @subject.reviews.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @review }
    end
  end

  # POST subjects/1/reviews
  # POST subjects/1/reviews.json
  def create
    @subject = Subject.find(params[:subject_id])
    @review = @subject.reviews.build(params[:review])
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to(subject_path(@review.subject), :notice => 'Review was successfully created.') }
        format.json { render :json => @review, :status => :created, :location => [@review.subject, @review] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to subjects_path }
      format.json { head :no_content }
    end
  end



  def destroy_multiple
    Comment.destroy(params[:comment_ids])
    flash[:notice] = "Successfully destroyed comments."
    redirect_to comments_path
  end

  def approve
    @comment = Comment.find(params[:id])
    @comment.mark_as_ham!
    redirect_to comments_path
  end

  def reject
    @comment = Comment.find(params[:id])
    @comment.mark_as_spam!
    redirect_to comments_path
  end

end
