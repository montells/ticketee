class AddAuthorToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :author, foreign_key: { to_table: :users }
  end
end
