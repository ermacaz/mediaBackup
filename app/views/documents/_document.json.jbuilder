json.extract! document, :id, :documentable_type, :documentable_id, :created_at
json.url rails_blob_url(document.doc)