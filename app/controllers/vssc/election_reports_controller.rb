class Vssc::ElectionReportsController < ApplicationController
  
  def show
    @er = Vssc::ElectionReport.find(params[:id])
    respond_to do |f|
      f.xml { render text: @er.to_xml_node.to_xml }
    end
  end
  
end
