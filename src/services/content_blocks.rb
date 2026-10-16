class App::Services::ContentBlocks < App::Services::Base
  def model; ContentBlock; end

  def list
    return_success(model.order(:position, :key).all.map(&:to_pos))
  end

  def self.fields
    {
      save: [:key, :payload, :position, :active]
    }
  end
end
