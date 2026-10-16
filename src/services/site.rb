class App::Services::Site < App::Services::Base
  # Single source of truth for the public website: every page renders from this payload.
  def show
    r.response['Cache-Control'] = 'public, max-age=60'
    blocks = ContentBlock.where(active: true).order(:position, :key).all
    return_success(blocks.to_h { |b| [b.key, b.plain_payload] })
  end
end
