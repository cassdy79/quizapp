class ApplicationController < ActionController::Base
    before_action :fill_database

    def fill_database
        if Question.all.size == 0
            quizFile = File.read('./quiz.json')
            quizzes = JSON.parse(quizFile)
            stored = []
            for quiz in quizzes do
                id = quiz['id']
                question = quiz['question']
                description = quiz['description']
                multiple_correct_answers = quiz['multiple_correct_answers']
                explanation = quiz['explanation']
                tip = quiz['tip']
                tags = ""
                if quiz['tip']
                    for tag in quiz['tags'] do
                        tags += ", "
                        tags += tag['name']
                    end
                    tags = tags[2..-1]
                else
                    tags = quiz['tip']
                end
                category = quiz['category']
                difficulty = quiz['difficulty']
                answer_a = quiz['answers']['answer_a']
                answer_b = quiz['answers']['answer_b']
                answer_c = quiz['answers']['answer_c']
                answer_d = quiz['answers']['answer_d']
                answer_e = quiz['answers']['answer_e']
                answer_f = quiz['answers']['answer_f']
                answer_a_correct = quiz['correct_answers']['answer_a_correct']
                answer_b_correct = quiz['correct_answers']['answer_b_correct']
                answer_c_correct = quiz['correct_answers']['answer_c_correct']
                answer_d_correct = quiz['correct_answers']['answer_d_correct']
                answer_e_correct = quiz['correct_answers']['answer_e_correct']
                answer_f_correct = quiz['correct_answers']['answer_f_correct']
                Question.create(id: id, question: question, description:description, multiple_correct_answers: multiple_correct_answers,
                explanation: explanation, tip: tip, tags: tags, category: category, difficulty: difficulty, answer_a: answer_a,
                answer_b: answer_b, answer_c: answer_c, answer_d: answer_d, answer_e: answer_e, answer_f: answer_f, answer_a_correct: answer_a_correct,
                answer_b_correct: answer_b_correct, answer_c_correct: answer_c_correct, answer_d_correct: answer_d_correct,
                answer_e_correct: answer_e_correct, answer_f_correct: answer_f_correct)
            end
        end
    end
end
