class App::Services::Users < App::Services::Base
  def model; User; end

  RESET_TOKEN_EXPIRATION_TIME = 2 * 60 * 60 

  def list
    ds = model.order(Sequel.desc(:created_at))
    if qs[:search].present?
      search_term = "%#{qs[:search]}%"
      ds = ds.where(Sequel.ilike(:full_name, search_term)).or(Sequel.ilike(:phone_number, search_term))
    end
    if App.cu.user_obj.rgm?
      ds = ds.where(parent_id: App.cu.user_obj.id)
    end
    count = ds.count
    return_success(ds.offset(offset).limit(limit).all.map(&:as_pos), total_pages: (count / page_size.to_f).ceil )
  end


  def get
    result = item.as_json(only: [:full_name, :email, :role, :id, :active])
    result.merge!(allowed_properties: item.property_ids, properties: Property.all.map{|p| {name: p.name, id: p.id}} )
    return_success(result)
  end

  def create
    obj = model.new(data_for(:save))
    if App.cu.user_obj.role == 2
      obj.role = 3
    end
    save(obj)
  end

  def info
    return_success(
      App.cu.user_obj.as_json(only: [:email, :id, :full_name, :role, :updated_at])
    )
  end

  MIN_PASSWORD_LENGTH = 12

  def update_password
    user = App.cu.user_obj
    return_errors!('Current password is incorrect.') unless user.password == params[:current_password]
    check_password_strength!(params[:new_password])

    user.password = params[:new_password]
    user.current_session_id = nil # sign out other sessions
    save(user) { return_success('Password updated. Please sign in again.') }
  end

  # Always answers the same way, so the response never reveals whether an account exists.
  def forgot_password
    email = params[:email].to_s.strip.downcase
    user = App::Models::User.where(email: email, active: true).first if email.present?
    begin
      user&.send_password_reset_email(App::Services::Seo.site_url)
    rescue => e
      App.logger.error("Password reset email failed: #{e.message}")
    end
    return_success('If that email belongs to an account, a reset link is on its way.')
  end

  def validate_password_token
    user = user_for_token(params['token'])
    user ? return_success('Token is valid.') : return_errors!('Invalid or expired link.')
  end

  def reset_password
    user = user_for_token(params['token']) || return_errors!('Invalid or expired link.')
    check_password_strength!(params['password'])

    user.password = params['password']
    user.reset_token = nil
    user.reset_sent_at = nil
    user.current_session_id = nil # sign out existing sessions
    save(user) { return_success('Password has been reset. Please sign in.') }
  end

  private

  def user_for_token(token)
    return nil if token.blank?

    user = App::Models::User.where(reset_token: token.to_s, active: true).first
    user if user&.reset_sent_at && (Time.now - user.reset_sent_at) < RESET_TOKEN_EXPIRATION_TIME
  end

  def check_password_strength!(password)
    return if password.to_s.length >= MIN_PASSWORD_LENGTH

    return_errors!("Password must be at least #{MIN_PASSWORD_LENGTH} characters.")
  end

  public

  def load_rgms
    return_success(
      model.where(role: 2).all.map{|u| {id: u.id, name: u.full_name, property_ids: u.property_ids}}
    )
  end
  




  def self.fields
    {
      save: [:full_name, :password, :email, :role, :property_ids, :active]
    }
  end
end