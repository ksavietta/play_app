require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Parser

  def initialize
    f = File.open(Rails.root.join('lib', 'assets', 'julius_caesar.xml').to_s)
    @doc = Nokogiri::XML(f)
    f.close

    find_roles
  end

  def doc
    @doc
  end

  def find_roles
    binding.pry
    @doc.xpath("//PERSONAE//PERSONA").each do |doc_role|
      role = Role.new
      role.name = doc_role.text
      role.save
    end
  end

end