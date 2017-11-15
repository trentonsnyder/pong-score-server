class DbSetup < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :password
      t.string :password_confirmation
    end

    create_table :players do |t|
      t.string :name
      t.belongs_to :account, index: true
    end

    create_table :participants do |t|
      t.belongs_to :player, index: true
      t.belongs_to :game, index: true
      t.integer :score, default: 0
    end

    create_table :games do |t|
      t.boolean :deuce, default: false
      t.bigint :server_id, foreign_key: true
      t.bigint :receiver_id, foreign_key: true
      t.belongs_to :account, index: true
    end

    create_table :points do |t|
      t.belongs_to :player, index: true
      t.belongs_to :game, index: true
      t.boolean :deuce, default: false
      t.timestamps
    end
  end
end
