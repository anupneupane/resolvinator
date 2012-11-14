class AnswersController < ApplicationController


   def create

    @issue = Issue.find(params[:issue_id])
    @answer = @issue.answers.build(params[:answer])
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to issue_path(@issue), notice: 'Answer was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

    def vote
    # raise params.inspect
    vote_value = params[:vote] == 'up' ? 1 : -1
    @vote = current_user.votes.new(:value => vote_value, :answer_id => params[:id])
    if @vote.save
      respond_to do |f|
        f.html {redirect_to :back, notice: "Thank you for voting"}
        f.js {}
      end
    else
      # format.json { render json: vote.errors, status: :unprocessable_entity }
      # flash[:notice] = "Messages"
      # debugger
      # flash[:notice] = {level: :error, message: @vote.errors.full_messages.to_sentence}
      flash.now[:error] = @vote.errors.full_messages.to_sentence

      respond_to do |f|
        f.html {redirect_to :back}
        f.js {}
      end
    end
  end


end
