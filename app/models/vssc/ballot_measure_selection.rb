class Vssc::BallotMeasureSelection < Vssc::BallotSelection
  define_attribute("selection", {:required=>true})
  
  def name
    selection
  end
  
end
