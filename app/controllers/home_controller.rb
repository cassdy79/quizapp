class HomeController < ApplicationController

  def index
    @memoryCount = 0
    @memoryCategory = "Linux"
    if cookies[:totalCount]
      @memoryCount = cookies[:totalCount].to_i
    end
    if cookies[:category]
      @memoryCategory = cookies[:category]
    end
    if cookies[:zero]
      @invalidChoice = true
    end
    cookies.delete :completedCount
    cookies.delete :success
    cookies.delete :zero
    session.clear
  end

  def setTotal
    if params[:number] == "0"
      cookies[:zero] = true
      cookies[:totalCount] = 0
      cookies[:category] = params[:category]
      redirect_to("/home")
    else
      cookies[:totalCount] = params[:number]
      cookies[:category] = params[:category]
      destroyValues()
      setValues(params[:category])
      redirect_to("/home/quiz")
    end
  end

  def destroyValues
    values = Question.all
    for value in values do
      value.destroy
    end
  end


  def quiz
    
    if cookies[:totalCount]
      totalCount = cookies[:totalCount].to_i
    else
      redirect_to("/home")
    end

    count = -1
    if cookies[:completedCount]
      count = cookies[:completedCount].to_i
    else
      cookies[:completedCount] = -1
    end
    quizlist = []
    quizzes = Question.all

    if count == -1
      cookies[:completedCount] = 0
      quizlist = quizzes.sample(totalCount)
      quizNumbers = []
      currQuiz = quizlist[count]
      for quiz in quizlist do
        quizNumbers << quiz.id
      end
      session[:quizList] = quizNumbers
      redirect_to("/home/quiz")
    elsif count == totalCount
      @allAnswered = true
      @totalCount = count
      @succesfulCount = cookies[:success]
      @prevAttempts = storeHistory(count.to_s, @succesfulCount)
    else
      values = session[:quizList]
      quizlist = []
      for value in values do
        quizlist << quizzes.find(value)
      end
       
      currentQuiz = quizlist[count]
      @category = currentQuiz.category
      @currQuestion = currentQuiz.question
      @currID = currentQuiz.id
      @currAnswers = []

      if currentQuiz.answer_a
        @currAnswers << currentQuiz.answer_a
      end
      if currentQuiz.answer_b
        @currAnswers << currentQuiz.answer_b
      end
      if currentQuiz.answer_c
        @currAnswers << currentQuiz.answer_c
      end
      if currentQuiz.answer_d
        @currAnswers << currentQuiz.answer_d
      end
      if currentQuiz.answer_e
        @currAnswers << currentQuiz.answer_e
      end
      if currentQuiz.answer_f
        @currAnswers << currentQuiz.answer_f
      end


    end
  end

  def submit
    value = cookies[:completedCount].to_i
    value += 1
    cookies[:completedCount] = value
    answer = params[:response]
    id = params[:currID]    

    quiz = Question.find(id)
    succesful = 0
    if cookies[:success]
      succesful = cookies[:success].to_i
    end


    if answer == quiz.answer_a
      if quiz.answer_a_correct
        succesful += 1
      end
    elsif answer == quiz.answer_b
      if quiz.answer_b_correct
        succesful += 1
      end
    elsif answer == quiz.answer_c
      if quiz.answer_c_correct
        succesful += 1
      end
    elsif answer == quiz.answer_d
      if quiz.answer_d_correct
        succesful += 1
      end
    elsif answer == quiz.answer_e
      if quiz.answer_e_correct
        succesful += 1
      end
    elsif answer == quiz.answer_f
      if quiz.answer_f_correct
        succesful += 1
      end
    end

    cookies[:success] = succesful
    redirect_to("/home/quiz")
  end



  def reloadQuiz
    cookies[:completedCount] = -1
    cookies[:success] = 0
    session.clear
    redirect_to("/home/quiz")
  end

  def storeHistory(total, success)
    timenow = Time.now.strftime("%I:%M %p")
    datenow = Time.now.strftime("%m-%d-%Y")
    storedArray = []
    formattedString = "At "+timenow+ ", "+datenow+", you answered "+success +"/"+ total +" questions correctly."
    if cookies[:history]
      oldString = cookies[:history]
      storedArray = oldString.split("|")
      formattedString += "|"
      formattedString += oldString
      cookies.permanent[:history] = formattedString
    else
      cookies.permanent[:history] = formattedString
    end

    if storedArray.size > 6
      newFormattedString = ""
      storedArray[0..4].each do |array|
        newFormattedString += array
        newFormattedString += "|"
      end
      newFormattedString = newFormattedString[0..-1]
      #cookies.permanent[:history] = newFormattedString
      storedArray = newFormattedString.split("|")
    end
    return storedArray
  end

  
  def setValues(category)
    begin
      response = RestClient::Request.execute(method: :get, url:"https://quizapi.io/api/v1/questions", 
        headers: {params: {:apiKey => 'CsC8hCmPMmez5RP1DAypWVyF8Vanh40B3aUonBwm', 
          :limit => 20, :category => category, :difficulty => "easy"}})
    
  
    #

    rescue RestClient::Exception => e       
      puts e
    end   
    quizzes = nil
    if response == nil
      quizFile = File.read('./quiz.json')
      quizzes = JSON.parse(quizFile)
    else
      quizzes = JSON.parse(response)
    end
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