class App::Models::ContentBlock < Sequel::Model
  def validate
    super
    validates_presence [:key, :payload]
    validates_unique :key
    validates_format(/\A[a-z][a-zA-Z0-9_]*\z/, :key, message: 'must be a camelCase or snake_case identifier')
  end

  # Plain Hash/Array of the JSONB column (the Sequel wrapper does not serialize via as_json).
  def plain_payload
    payload.respond_to?(:__getobj__) ? payload.__getobj__ : payload
  end

  def to_pos
    { id: id, key: key, payload: plain_payload, position: position, active: active, updated_at: updated_at }
  end
end
