class Post < ApplicationRecord
scope :only_deleted, -> { unscope(where: :deleted).where.not(deleted: false) }
scope :with_deleted, -> { unscope(where: :deleted) }
has_many :comments, dependent: :destroy

default_scope -> { where(deleted: false) }
end
