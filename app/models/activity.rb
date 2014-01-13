class Activity < ActiveRecord::Base

  self.inheritance_column = nil

  belongs_to :user
  belongs_to :project  

  def self.commented; @@COMMENTED end

  def self.created; @@CREATED end

  def self.uploaded; @@UPLOADED end

  def self.project; @@PROJECT end

  def is_created?
    self.action == @@CREATED
  end

  def is_commented?
    self.action == @@COMMENTED
  end

  def is_uploaded?
    self.action == @@UPLOADED
  end

  def is_project?
    self.item_type == @@PROJECT
  end

  private
    @@COMMENTED = 'COMMENT'
    @@CREATED = 'CREATE'
    @@UPLOADED = 'UPLOAD'
    @@PROJECT = 'PROJECT'
end
