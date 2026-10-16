Sequel.migration do
  change do
    create_table(:leads) do
      primary_key :id

      String :name, null: false
      String :email, null: false, size: 200
      String :company
      String :role
      String :goal, text: true, null: false
      String :interest
      String :stage
      String :timeline
      String :source_page
      jsonb :attribution, default: '{}'
      TrueClass :consent, default: false
      String :status, default: 'new'

      String :created_ip
      String :updated_ip
      Integer :created_by
      Integer :updated_by
      DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, default: Sequel::CURRENT_TIMESTAMP

      index :email
      index :status
      index :created_at
    end
  end
end
