class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion:{ in:["PENDING", "APPROVED", "DENIED"] }
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      # debugger
      overlapping_pending_requests.each do |request|
        request.deny!
      end
      self.save!
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == "PENDING"
  end

  private

  def overlapping_requests
    overlap = CatRentalRequest.where(<<-SQL)
      start_date BETWEEN '#{start_date}' AND '#{end_date}'
      OR
      end_date BETWEEN '#{start_date}' AND '#{end_date}'
    SQL
    overlap.where(cat_id: self.cat_id).where.not(id: self.id)
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      self.errors[:base] << "Overlapping dates"
    end
  end

end
