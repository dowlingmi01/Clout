class CreateJoinTableVoteOptionVote < ActiveRecord::Migration[7.0]
  def change
    create_join_table :vote_options, :votes do |t|
      t.index [:vote_option_id, :vote_id]
    end
  end

end
