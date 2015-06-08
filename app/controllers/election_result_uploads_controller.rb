class ElectionResultUploadsController < ApplicationController
  
  def index
    @ers = ElectionResultUpload.order("created_at desc")
  end
  
end
