class DocumentsController < ApplicationController
  before_action :authenticate_user, only: %i[create]

  def create
    @document = Document.new(document_params)
    if @document.save
      return success_document_save
    else
      return error_save @document
    end
  end

  protected

  def success_document_save
    render status: :created, template: 'documents/show.json.jbuilder'
  end

  def error_save obj
    render status: :unprocessable_entity, json: {errors: obj.errors.full_messages}
  end

  private

  def document_params
    params.permit(:doc_contents, :doc_name)
  end
end
