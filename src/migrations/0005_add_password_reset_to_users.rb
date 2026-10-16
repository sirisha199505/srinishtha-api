Sequel.migration do
  change do
    alter_table(:users) do
      add_column :reset_token, String
      add_column :reset_sent_at, DateTime
      add_index :email
    end
  end
end
