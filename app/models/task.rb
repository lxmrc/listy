class Task < ApplicationRecord
  validates :description, presence: true

  def complete
    self.update(completed: true)
  end

  def uncomplete
    self.update(completed: false)
  end
end
