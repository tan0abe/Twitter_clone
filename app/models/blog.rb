class Blog < ApplicationRecord
  validates :content, presence: true  #contentの値を空だった場合は値を保存しない
end
