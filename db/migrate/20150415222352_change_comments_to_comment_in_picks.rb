class ChangeCommentsToCommentInPicks < ActiveRecord::Migration
  def change
    rename_column :picks, :comments, :comment
  end
end
