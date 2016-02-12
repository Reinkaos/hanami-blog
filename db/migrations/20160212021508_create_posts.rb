Hanami::Model.migration do
  change do
    create_table :posts do
      primary_key :id
      column :title,      String,   null: false
      column :body,       String,   null: false
      column :author,     String,   null: false
    end
  end
end
