class App::Models::Lead < Sequel::Model
  # Option values are owned by the `contactForm` content block, so the form and
  # the validation always agree.
  EMAIL_FORMAT = /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/
  STATUSES = %w[new contacted qualified closed].freeze

  def self.allowed(field)
    form = App::Models::ContentBlock.first(key: 'contactForm')&.payload || {}
    (form.dig('options', field) || []).map { |o| o['value'] }
  end

  def validate
    super
    validates_presence [:name, :email, :goal]
    validates_max_length 120, :name
    validates_max_length 200, :email
    validates_max_length 4000, :goal
    validates_format EMAIL_FORMAT, :email, message: 'is not a valid email'
    validates_includes STATUSES, :status, allow_nil: true
    errors.add(:consent, 'is required') unless consent

    %w[interest stage timeline].each do |field|
      value = send(field)
      next if value.blank?
      errors.add(field.to_sym, 'is not a valid option') unless self.class.allowed(field).include?(value)
    end
  end

  def to_pos
    as_json(except: [:updated_ip, :created_by, :updated_by])
  end
end
