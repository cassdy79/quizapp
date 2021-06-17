class HomeController < ApplicationController

  def index
    cookies.delete :completedCount
    cookies.delete :success
  end

  def setTotal
    cookies[:totalCount] = params[:number]
    redirect_to("/home/quiz")
  end

  def quiz
    totalCount = cookies[:totalCount].to_i
    count = -1
    if cookies[:completedCount]
      count = cookies[:completedCount].to_i
    else
      cookies[:completedCount] = { value: -1, expires: 1.hour }
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

    if storedArray.size == 6
      newFormattedString = ""
      storedArray[0..4].each do |array|
        newFormattedString += array
        newFormattedString += "|"
      end
      newFormattedString = newFormattedString[0..-1]
      cookies.permanent[:history] = newFormattedString
      storedArray = newFormattedString.split("|")
    end
    
    return storedArray
  end

end