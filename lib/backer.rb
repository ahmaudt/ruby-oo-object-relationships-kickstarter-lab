require 'pry'
require_relative './project_backer.rb'

class Backer
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def back_project(project)
        support_project = ProjectBacker.new(project, self)
    end
    def projects
        ProjectBacker.all.select { |project| project.backer == self }
    end

    def backed_projects
        projects.map { |project| project.project }
    end
end