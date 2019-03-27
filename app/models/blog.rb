class Blog < ApplicationRecord
  validates :content, length: { minimum: 1 }  #1文字以上
  validates :content, length: { maximum: 140 }  #140文字以下
end
