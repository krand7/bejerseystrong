require 'yaml'

namespace :admin do
  desc "Create questions"
  task load_answers: :environment do
    data_file = YAML.load_file(Rails.root.join('lib', 'data', 'answers.yml'))
    data_file['answers'].each do |answer_attributes|
      question = Question.find_by_slug(answer_attributes['question_slug'])
      answer_attributes['question_id'] = question.id
      answer_attributes['value'] = question.answers.count
      answer_attributes['slug'] = answer_attributes['question_slug'].to_s + '_' + question.answers.count.to_s
      answer = Answer.create(answer_attributes.except('question_slug'))
      puts "Created: " + answer.content
    end
  end
end
