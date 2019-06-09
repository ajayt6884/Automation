class Comment < ApplicationRecord
scope :only_deleted, -> { unscope(where: :deleted).where.not(deleted: false) }
scope :with_deleted, -> { unscope(where: :deleted) }
belongs_to :post

default_scope -> { where(deleted: false) }

end
