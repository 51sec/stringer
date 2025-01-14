# frozen_string_literal: true

class StoriesController < ApplicationController
  def index
    @unread_stories = StoryRepository.unread
  end

  def update
    json_params = JSON.parse(request.body.read, symbolize_names: true)

    story = StoryRepository.fetch(params[:id])
    story.update!(json_params.slice(:is_read, :is_starred, :keep_unread))

    head(:no_content)
  end

  def mark_all_as_read
    MarkAllAsRead.call(params[:story_ids])

    redirect_to("/news")
  end

  def archived
    @read_stories = StoryRepository.read(params[:page])
  end

  def starred
    @starred_stories = StoryRepository.starred(params[:page])
  end
end
