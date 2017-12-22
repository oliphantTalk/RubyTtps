class StudentsController < ApplicationController
  before_action :set_student, only: [ :add_student_to_evaluation, :show, :edit, :update, :destroy]
  before_action :set_evaluation_student, only: [:update_calification]
  before_action :set_course, except: [:add_student_to_evaluation]
  # GET /students
  # GET /students.json
  def index
    if params[:evaluation_id].present?
      @evaluation = Evaluation.find(params[:evaluation_id])
      @course = @evaluation.course
    end
    @students = @course.students.order(:surname, :name)
  end

  # GET /stu
  # dents/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
      @student = Student.new
      @course.students.build
  end


  def add_student_to_evaluation
    if params[:evaluation_id].present?
      @evaluation = Evaluation.find(params[:evaluation_id])
      @evaluation.students << @student
      respond_to do |format|
        if @evaluation.save
          format.html { redirect_to evaluation_path(@evaluation), notice: 'Se ha inscripto correctamente.' }
          #format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def index_evaluation_students
    @evaluation = Evaluation.find(params[:evaluation_id])
    @students = @evaluation.students

    render 'students/enrolled'
  end

  def edit_evaluation_students
    @evaluation = Evaluation.find(params[:evaluation_id])
    @students = @evaluation.students

    render 'students/calificate'
  end

  def update_calification
    score = params[:student][:evaluation_student][:score]
    comment = params[:student][:evaluation_student][:comment]
    @evaluation_student.update(:score => score, :comment => comment )
    respond_to do |format|
      if @evaluation_student.save
        format.html { redirect_to request.referrer, notice: 'Parametros actualizados.' }
        format.json { render :show, status: :ok, location: @student }
      end
    end
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = @course.students.new(student_params)

    respond_to do |format|
      if @course.save
    #    Course.find(params[:course_id]).students << @student
        format.html { redirect_to course_students_path(@course), notice: 'Estudiante creado' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to course_students_path(@course), notice: 'Parametros de estudiantes actualizados.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Estudiante eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def set_course
      if(params[:course_id].present?)
        @course=Course.find(params[:course_id])
      end
    end

    def set_evaluation_student

      @evaluation_student = EvaluationStudent.find_by(:evaluation_id => params[:evaluation_id], :student_id => params[:student_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.fetch(:student, {})
      params.require(:student).permit(:name, :surname, :dni, :legajo, :email, :course_id)
    end
end
