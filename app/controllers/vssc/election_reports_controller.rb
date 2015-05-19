class Vssc::ElectionReportsController < ApplicationController
  
  def show
    @er = Vssc::ElectionReport.find(params[:id])
    respond_to do |f|
      f.xml { render text: @er.to_xml_node.to_xml }
    end
  end
  
  def update
    @er = Vssc::ElectionReport.find(params[:id])
    @er.update(election_report_params)
    redirect_to @er.jurisdiction
  end
  
  def destroy
    @er = Vssc::ElectionReport.find(params[:id])
    @er.destroy!
    redirect_to @er.jurisdiction
  end
  
private
    def election_report_params
      params.require(:vssc_election_report).permit(:election_results_csv)
    end


  
  
end
