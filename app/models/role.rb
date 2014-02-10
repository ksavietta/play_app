class Role < ActiveRecord::Base

  belongs_to :play,
    inverse_of: :roles


  def num_lines
    if self.number_of_lines_spoken == nil
      total_line_count = 0
      longest_speech = 0
      self.play.doc.xpath("//SPEECH").each do |speech_doc|
          if speech_doc.xpath("SPEAKER").text ==self.name
            speech_line_count = speech_doc.xpath("LINE").count
            total_line_count += speech_line_count
            longest_speech = speech_line_count if longest_speech < speech_line_count
          end
      end
      self.number_of_lines_spoken = total_line_count
      self.longest_speech = longest_speech
    else
      self.number_of_lines_spoken
    end
  end

  def num_scenes
    if self.number_of_scences_role_appears == nil
     scene_count = 0
     self.play.doc.xpath("//SCENE").each do |scene_doc|
      scene_count +=1

     end

     self.number_of_scences_role_appears = scene_count
    else
      self.number_of_scences_role_appears
    end
  end

  # def long_speech
  #   if self.longest_speech == nil
  #     self.longest_speech = 1
  #   else
  #     self.longest_speech
  #   end
  # end

  def percent_scenes
    if self.percent_total_scenes == nil
     self.percent_total_scenes = 1
    else
      self.percent_total_scenes
    end
  end

end