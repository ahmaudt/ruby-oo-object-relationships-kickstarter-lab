require 'pry'
require_relative './project_backer.rb'

class Project
    attr_accessor :title
    @@all = []
    def initialize(title)
        @title = title
        @@all << self
    end
    def self.all
        @@all
    end
    def add_backer(backer)
        new_project_supporter = ProjectBacker.new(self, backer)
    end
    def projects
        ProjectBacker.all.select { |project| project.project == self }
    end

    def backers
        projects.map { |project| project.backer }
    end
end