require 'yaml'

namespace :admin do
  desc "Create questions"
  task load_questions: :environment do
    data_file = YAML.load_file(Rails.root.join('lib', 'data', 'questions.yml'))
    data_file['questions'].each do |question_attributes|
      question = Question.create(question_attributes)
      puts "Created: " + question.content
    end
  end
end
