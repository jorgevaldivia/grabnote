class Notebook::NotesController < ApplicationController
  before_action :set_notebook
  before_action :set_notebook_note, only: [:show, :edit, :update, :destroy]

  # GET /notebook/notes
  # GET /notebook/notes.json
  def index
    @notebook_notes = Notebook::Note.all
  end

  # GET /notebook/notes/1
  # GET /notebook/notes/1.json
  def show
    render 'show', layout: "detail_editor"
  end

  # GET /notebook/notes/new
  def new
    @notebook_note = Notebook::Note.new
  end

  # GET /notebook/notes/1/edit
  def edit
  end

  # POST /notebook/notes
  # POST /notebook/notes.json
  def create
    @notebook_note = Notebook::Note.new(notebook_note_params)

    respond_to do |format|
      if @notebook_note.save
        format.html { redirect_to @notebook_note, notice: 'Note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notebook_note }
      else
        format.html { render action: 'new' }
        format.json { render json: @notebook_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notebook/notes/1
  # PATCH/PUT /notebook/notes/1.json
  def update
    respond_to do |format|
      if @notebook_note.update(notebook_note_params)
        format.html { redirect_to @notebook_note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notebook_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notebook/notes/1
  # DELETE /notebook/notes/1.json
  def destroy
    @notebook_note.destroy
    respond_to do |format|
      format.html { redirect_to notebook_notes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = Notebook.find(params[:notebook_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook_note
      @notebook_note = Notebook::Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notebook_note_params
      params.require(:notebook_note).permit(:user_id, :notebook_id, :name, :token)
    end
end
