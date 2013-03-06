class AddLocableToUser < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
  		t.integer  :failed_attempts, :default => 0 
  		t.datetime :locked_at
	end

  end
end
