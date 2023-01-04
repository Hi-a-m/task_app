class Post < ApplicationRecord
    validates :title, presence: true
    validates :start_at, presence: true
    validates :end_at, presence: true
    validates :memo, length: { maximum: 500 }
    validate :start_end_check
      def start_end_check
        errors.add(:end_at, "の日付を正しく記入してください。") unless
        self.start_at < self.end_at
      end
end
