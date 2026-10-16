Sequel.migration do
  change do
    create_table(:content_blocks) do
      primary_key :id
      String :key, null: false
      jsonb :payload, null: false, default: '{}'
      Integer :position, default: 0
      TrueClass :active, default: true

      Integer :created_by
      Integer :updated_by
      DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, default: Sequel::CURRENT_TIMESTAMP

      index :key, unique: true
      index :active
    end
  end
end
