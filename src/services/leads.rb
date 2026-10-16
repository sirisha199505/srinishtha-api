class App::Services::Leads < App::Services::Base
  def model; Lead; end

  ATTRIBUTION_KEYS = %w[utm_source utm_medium utm_campaign utm_term utm_content referrer].freeze

  def create
    # Honeypot: real visitors never see this field; bots fill it. Pretend success.
    return return_success(message: success_message) if params[:website].present?

    lead = model.new(data_for(:save).transform_values { |v| v.is_a?(String) ? v.strip : v })
    lead.email = lead.email&.downcase
    lead.consent = [true, 'true', '1', 'on'].include?(params[:consent])
    lead.attribution = (params[:attribution] || {}).to_h.slice(*ATTRIBUTION_KEYS)

    save(lead) { return_success(message: success_message) }
  end

  def list
    ds = model.order(Sequel.desc(:created_at))
    ds = ds.where(status: qs[:status]) if qs[:status].present?
    count = ds.count
    return_success(ds.offset(offset).limit(limit).all.map(&:to_pos), total_pages: (count / page_size.to_f).ceil)
  end

  def update
    super(data_for(:update))
  end

  private

  def success_message
    "Thank you. We'll respond within one business day."
  end

  def self.fields
    {
      save: [:name, :email, :company, :role, :goal, :interest, :stage, :timeline, :source_page],
      update: [:status]
    }
  end
end
