require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Play < ActiveRecord::Base
  validates_presence_of :name

  has_many :roles,
    inverse_of: :play,
    dependent: :destroy

  has_attached_file :xml

  attr_reader :scene_count, :doc

  def display_roles
    self.roles.take(10)
  end

  def analyze_and_save
    parse_file
    find_roles
    count_num_scenes
    run_role_stats
    self.save
  end

  def parse_file
    f = File.open(Rails.root.join('lib', 'assets', 'julius_caesar.xml').to_s)
    @doc = Nokogiri::XML(f)
    f.close
  end

  def find_roles
    @doc.xpath("//PERSONAE//PERSONA").each do |doc_role|
      role = Role.new
      role.name = doc_role.text
      self.roles << role
    end
  end

  def count_num_scenes
    @scene_count = @doc.xpath("//SCENE").count
  end

  def run_role_stats
    self.roles.each do |role|
      role.num_lines
      role.num_scenes
      # role.percent_scenes
      # role.long_speech
    end
  end

end