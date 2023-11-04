class JobOffer < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :position, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :salary, numericality: { greater_than: 0 }

  STATUS_OPTIONS = {
    "Activo" => "active",
    "No Activo" => "inactive"
  }
  
  def self.available
    where(availability: 'Activo') # Asume que 'Activo' es el estado que indica que la oferta está disponible.
  end
end
